<?php
require_once("includes/initialize.php");
// require_once("views/common_language.php");

$result = $navigation = $home_gift_sets_modal = $home_gift_sets_script = $listofitem = '';
$serachtitle = 'List of Products';
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
    $sql = "SELECT prod.* FROM tbl_product_sub as prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status = 1";
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
                } elseif (end($qservice) == $qserv) {
                    $sql .= " OR prod.service_id = $qserv )";
                } else {
                    $sql .= " OR prod.service_id = $qserv ";
                }
            } else {
                $sql .= " AND prod.service_id = $qserv ";
            }
        }
    }
    if (@$service_slug) {
        $ser = Services::find_by_slug($service_slug);
        $serachtitle = $ser->title;
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
    if (@$category_slug) {
        $cate = Destination::find_by_slug($category_slug);
        $serachtitle = $cate->title;
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
    if (@$subcategory_slug) {
        $subcate = Destination::find_by_slug($subcategory_slug);
        $serachtitle = $subcate->title;
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
    if (@$brand_slug) {
        $bran = Activities::find_by_slug($brand_slug);
        $serachtitle = $bran->title;
        $sql .= " AND prod.brand = $bran->id ";
    }
    if (!empty($glprice) and !empty($ghprice)) {
        $sql .= " AND ( (prod.discount1 >= $glprice AND prod.discount1 <= $ghprice) OR (prod.discount1 = 0 AND prod.price1 >= $glprice AND prod.price1 <= $ghprice) ) ";
    }
    
    $page = 1;
    $limit = 150000000;
    $total_num = $db->num_rows($db->query($sql));
    $startpoint = ($page * $limit) - $limit;
    $start = $startpoint + 1;
    $end = (($startpoint + $limit) > $total_num) ? $total_num : $startpoint + $limit;
    $sql .= " ORDER BY sortorder ASC";
    $sql .= " LIMIT " . $startpoint . "," . $limit;

    $res = $db->query($sql);
    $total = $db->affected_rows($res);

    $listofitem .= '(' . $total . ' items found)';
    if ($total > 0) {
        $i = 1;
        while ($rows = $db->fetch_array($res)) {
            // pr($rows);

            // if (file_exists(SITE_ROOT . 'images/package/' . $rows['image'])) {
            // $rating = Package::get_avg_rating($rows['id']);
            // $days = ($rows['days'] == 1) ? 'day' : 'days';

            $price_text = '';
            if (!empty($rows['price1']) and (empty($rows['offer_price']))) {
                $price_text = '<span>' . $rows['currency'] . ' ' . $rows['price1'] . '</span>';
            }
            if (!empty($rows['discount1'])) {
                $discountamt= $rows['price1'] - $rows['discount1'];
                $price_text = '
                <span>' . $rows['currency'] . ' '.$rows['discount1'].'</span>|<span>' . $rows['discountedp'] . '%off</span><br/>
                        <del>' . $rows['currency'] . ' ' . $rows['price1'] . '</del> <span class="font-14">Save ' . $rows['currency'] . ' ' . $discountamt. '</span> 
                
                ';
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
            $prodbrand = Brand::find_by_id($rows['brand']);
            $prodservice = Services::find_by_id($rows['service_id']);
            if (!empty($prodbrand)) {
                $title = $prodbrand->title;
            } else {
                $title = '';
            }
            if (!empty($prodservice)) {
                $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $rows['slug'] . '';
            } else {
                $slugs = '' . BASE_URL . 'product/product-detail/' . $rows['slug'] . '';;
            }
            $prodbrand = Brand::find_by_id($rows['brand']);
            $prodservice = Services::find_by_id($rows['service_id']);
            if (!empty($prodbrand)) {
                $title = $prodbrand->title;
                $slug = $prodbrand->slug;
            } else {
                $title = '';
                $slug = '';
            }
            if (!empty($prodservice)) {
                $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $rows['slug'] . '';
            } else {
                $slugs = '' . BASE_URL . 'product/product-detail/' . $rows['slug'] . '';;
            }

            // for top part (opening)
            if ($i % 3 == 1) {
                $result .= '
                    <div class="lazy"><!--
                ';
            }
            $result .= '<div class="col-xl-3 col-sm-6 col-6">
                <div class="ltn__product-item ltn__product-item-3 text-center">
                  <a href="' . BASE_URL . 'product/productdetails/' . $rows['slug'] . '" class="product-link">  <div class="product-img product_hove" data-href="' . BASE_URL . 'product/' . $rows['slug'] . '">
                        <img src="' . $img . '" alt="' . $rows['title'] . '">
                    </div></a>
                    <div class="product-info">
                        <h4 class="product-title"><a href="' . BASE_URL . 'search/' . @$prodbrand->slug . '" class="product-link">' . $title . '</a></h4>
                        <a href="' . $slugs . '" class="product-link">' . $rows['title'] . '</a>
                        <div class="product-price">' . $price_text . '</div>
                        <div class="product-action">';
            if (!empty($rows['tag'])) {
                $result .= '<li class="sale-badge">' . $rows['tag'] . '</li>';
            }
            $result .= '    <ul>
                                <li><a href="#" class="add-wishlist" title="Add to Wishlist" data-cartid="' . $rows['slug'] . '"><i class="far fa-heart"></i></a></li>
                                <li>
                                    <a href="#" title="ADD TO CART" class="add-to-cart" data-toggle="modal" data-target="#quick_view_modal_product_' . $rows['slug'] . '">
                                        Add to Cart <i class="fas fa-shopping-cart"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                </div>';
            // for bottom part (closing)
            if ($i % 3 == 0 or $i == $total) {
                $result .= ' 
                    --></div>
                ';
            }
            $i++;


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
            <script>
                $("body").on("shown.bs.modal", "#quick_view_modal_product_' . $rows['slug'] . '", function () {
                  setTimeout(reinitialiseSlick("#quick_view_modal_product_' . $rows['slug'] . '"), 500)
                });
            </script>
            ';
            $home_gift_sets_modal .= '
                <div class="ltn__modal-area ltn__quick-view-modal-area ">
                    <div class="modal fade" id="quick_view_modal_product_' . $rows['slug'] . '" tabindex="-1">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
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
                        $home_gift_sets_modal .= '<div class="col-lg-12"><div class="ltn__blog-item ltn__blog-item-3"><div class="ltn__blog-img"><img src="' . IMAGE_PATH . 'product/galleryimages/' . $sliderImage->image . '" alt="' . $sliderImage->title . '"></div></div></div>';
                    }
                }
            }

            $home_gift_sets_modal .= '
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-7 col-12">
                                                    <div class="modal-product-info">
                                                    <h4 class="product-title"><a href="' . BASE_URL . 'search/' . $slug . '" class="product-link">' . $title . '</a></h4>
                                                    <h3>' . $rows['title'] . '</h3>
                                                        ' . $rows['brief'] . '
                                                        <br/>
                                                        <br/>

                                                        <a href="' . $slugs . '" class="" style="font-size: 0.85em; text-decoration: underline; text-transform: capitalize; color: #0E75BA ;">
                                                            <span> VIEW MORE</span>
                                                        </a>
                <div class="shoping-cart-table table-responsive">
                    <form id="add-cart-product-' . $rows['slug'] . '">
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

            $home_gift_sets_modal .= '<input type="hidden" name="product_qnt_1" value="' . $rows['slug'] . '">
                                        <input type="hidden" name="product_net_qnt_1" value="' . $rows['netqnt1'] . '">
                                        <label class="form-check-label">' . $rows['netqnt1'] . '</label>
                                    </div>
                                </td>
                                
                                <td class="cart-product-price"><input type="hidden" name="product_price_1" value="' . $prodPrice . '">' . $rows['currency'] . ' ' . sprintf("%.2f", $prodPrice) . '</td>
                                <td class="cart-product-quantity">
                                <span>QTY</span
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $rows['currency'] . ' " readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_1" class="product_total" value="' . $prodPrice . '">
                                    <h6 class="product-sub-total">' . $rows['currency'] . ' ' . sprintf("%.2f", $prodPrice) . '</h6>
                                </td>
                            </tr>                            
                            </tbody>
                            </table>
                            </form>
                        </div>
                                                                <div class="ltn__product-details-menu-2">  
                                                                    <ul>
                                                                    <li style="padding-right: 16.28rem;">
                                                                    <a href="#" class="add-wishlist theme-btn-2 btn btn-effect-2" title="" data-cartid="' . $rows['slug'] . '">
                                                                        <i class="far fa-heart"></i>
                                                                    </a>
                                                                </li>
                                                                    
                                                                        <li>
                                                                            <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="ADD TO CART" data-cartid="' . $rows['slug'] . '" form-id="add-cart-product-' . $rows['slug'] . '">
                                                                                <i class="fas fa-shopping-cart"></i>
                                                                                <span>ADD TO CART</span>
                                                                            </a>
                                                                        </li>
                                                                      
                                                                        
                                                                        <!--<li>
                                                                        <a href="' . BASE_URL . 'checkout" class="theme-btn-1 btn btn-effect-1"> <i class="fas fa-sign-out-alt"></i> CHECKOUT</a>
                                                                        </li>-->
                
                                                                       
                                                                       
                                                                    </ul>
                                                                </div>
                                                                <hr>
                                                                <div class="ltn__social-media">
                                                                    <ul>
                                                                        <li>Share:</li>
                                                                        <li>
                <a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/product-detail/' . $rows['slug'] . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                                                        </li>
                                                                        <li>
                <a href="https://twitter.com/share?url=' . BASE_URL . 'product/product-detail/' . $rows['slug'] . '&text=' . (($lang == 'gr') ? $rows['title_greek'] : $rows['title']) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                                                        </li>
                                                                        <li>
                <a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/product-detail/' . $rows['slug'] . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
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
    } else {
        $result .= '<figure class="tour-long-item-01"><h3>No Result Found</h3></figure>';
    }
    $result = preg_replace('/\s+/', ' ', $result);
    $result = str_replace(array("\r", "\n"), '', $result);

    $home_gift_sets_modal = preg_replace('/\s+/', ' ', $home_gift_sets_modal);
    $home_gift_sets_modal = str_replace(array("\r", "\n"), '', $home_gift_sets_modal);

    $home_gift_sets_script = preg_replace('/\s+/', ' ', $home_gift_sets_script);
    $home_gift_sets_script = str_replace(array("\r", "\n"), '', $home_gift_sets_script);


    echo json_encode(array("action" => "success", "result" => $result, "popup" => $home_gift_sets_modal, "popscript" => $home_gift_sets_script, "itemlist" => $listofitem, "serachtitle" => $serachtitle, "nav" => $navigation));
}

?>
