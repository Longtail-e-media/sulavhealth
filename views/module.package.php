<?php
/**
 *          Home sub package list
 */
$reshplist = '';

if (defined('HOME_PAGE')) {
    $packagehome = Package::getHomePackage(1);

    foreach ($packagehome as $key => $RecRow) {
        $homesubpkgs = Subpackage::get_relatedpkg($RecRow->id);
        foreach ($homesubpkgs as $homesubpkg) {
            $imgSrc = BASE_URL . 'template/web/img/services/personal.jpg';
            $imgs = unserialize($homesubpkg->image);
            if (!empty($imgs)) {
                $file_path = SITE_ROOT . 'images/subpackage/' . $imgs[0];
                if (file_exists($file_path)) {
                    $imgSrc = IMAGE_PATH . 'subpackage/' . $imgs[0];
                }
            }
            $reshplist .= '
                <div class="col-lg-4">
                    <div class="room-box extra-height">
                        <div class="room-bg" style="background-image: url(' . $imgSrc . ');">
                        </div>
                        <div class="room-content">
                            <h3><a href="' . BASE_URL . $homesubpkg->slug . '">' . ($homesubpkg->title) . '</a></h3>
                        </div>
                    </div>
                </div>
            ';
        }
    }
}

$jVars['module:package:home-packagelist'] = $reshplist;


/**
 *          Package list page
 */
$packagelist = $packagelistbread = '';

if (defined('PACKAGE_LIST_PAGE')) {
    $sql = "SELECT *
        FROM tbl_package
        WHERE status='1' ORDER BY sortorder ASC ";
    $page = (isset($_REQUEST["pageno"]) and !empty($_REQUEST["pageno"])) ? $_REQUEST["pageno"] : 1;
    $limit = 8;
    $total = $db->num_rows($db->query($sql));
    $startpoint = ($page * $limit) - $limit;
    $sql .= " LIMIT " . $startpoint . "," . $limit;
    $query = $db->query($sql);
    $pkgRecList = Package::find_by_sql($sql);
    // echo "<pre>"; print_r($pkgRecList); die();
    if (!empty($pkgRecList)) {
        $packagelist .= '<section class="blog blog-pages">
                <div class="container">
                    <!--======= Blog POST =========-->
                    <ul>';
        foreach ($pkgRecList as $key => $RecRow) {
            if ($key % 2 == 0) {
                $packagelist .= '<!-- Blog Post 1 -->
                        <li class="row">
                            <!-- Post Image -->
                            <div class="col-sm-6 text-center">';
                $file_path = SITE_ROOT . 'images/package/listimage/' . $RecRow->list_image;
                if (file_exists($file_path) and !empty($RecRow->list_image)) {
                    $packagelist .= ' <div class="post-img"> <img class="img-responsive" src="' . IMAGE_PATH . 'package/listimage/' . $RecRow->list_image . '" alt="' . $RecRow->title . '"> </div>';
                }
                $packagelist .= '</div>

                           <!-- Post Text Sec -->
                            <div class="col-sm-6">
                                <div class="text-section text-left"> <a href="' . BASE_URL . 'treatment/' . $RecRow->slug . '">' . ($RecRow->title) . '</a>
                                    <p>' . ($RecRow->detail) . '</p>
                                    <a href="' . BASE_URL . 'treatment/' . $RecRow->slug . '" class="btn btn-1">' . VIEW_MORE . '</a>
                                </div>
                            </div>
                        </li>';
            } else {

                $packagelist .= '<!-- Blog Post 2 -->
                        <li class="row">
			<!-- Post Image -->
                            <div class="col-sm-6 col-md-7 col-md-push-5 text-center">';
                $file_path = SITE_ROOT . 'images/package/listimage/' . $RecRow->list_image;
                if (file_exists($file_path) and !empty($RecRow->list_image)) {
                    $packagelist .= ' <div class="post-img left"> <img class="img-responsive" src="' . IMAGE_PATH . 'package/listimage/' . $RecRow->list_image . '" alt="' . ($RecRow->title) . '"> </div>';
                }
                $packagelist .= '</div>
                            <!-- Post Text Sec -->
                            <div class="col-sm-6 col-md-5 col-md-pull-7">
                                <div class="text-section text-right"> <a href="' . BASE_URL . 'treatment/' . $RecRow->slug . '"> ' . ($RecRow->title) . '</a>
                                    <p>' . ($RecRow->detail) . '</p>
                                    <a href="' . BASE_URL . 'treatment/' . $RecRow->slug . '" class="btn btn-1">' . VIEW_MORE . '</a>
                                </div>
                            </div>
                            
                        </li>';
            }
        }

        $packagelist .= '</ul>

                    <!--======= PAGINATION =========-->
                    <nav>';
        $url = BASE_URL . 'rooms';
        $packagelist .= get_front_pagination($total, $limit, $page, $url);

        $packagelist .= '</nav>
                </div>
            </section>';

    }

    $packagelistbread .= '<div class="container">
		                    <div class="row text-center">
		                        <ol class="breadcrumb">
		                            <li><a href="' . BASE_URL . 'home">' . Home . ' </a></li>
		                            <li class="active">' . IMGTREAT_TITLE . '</li>
		                        </ol>
		                        <h2 class="text-center">' . IMGTREAT_TITLE . '</h2>
		                    </div>
		                </div>';

}

$jVars['module:list-package'] = $packagelist;
$jVars['module:list-package-bred'] = $packagelistbread;


/**
 *          Package Detail Page
 */
$packagedetail = $packagebread = '';

if (defined('PACKAGE_PAGE') and isset($_REQUEST['slug'])) {
    $slug = !empty($_REQUEST['slug']) ? addslashes($_REQUEST['slug']) : '';
    $pkgRec = Package::find_by_slug($slug);

    if (!empty($pkgRec)) {

        $banner_img = BASE_URL . 'template/web/img/banner/005-cut-2.jpg';
        $file_path = SITE_ROOT . 'images/package/' . $pkgRec->image;
        if (file_exists($file_path) and !empty($pkgRec->image)) {
            $banner_img = IMAGE_PATH . 'package/' . $pkgRec->image;
        }

        $packagebread .= '
            <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-image" data-bg="' . $banner_img . '">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                                <div class="section-title-area ltn__section-title-2">
                                    <h1 class="section-title white-color"><strong>' . ($pkgRec->title) . '</strong></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        ';

        $packagedetail .= '
            <div class="row">
                <div class="col-md-4">
                    <div class="nav flex-column nav-pills widget ltn__menu-widget sticky" id="v-pills-tab" role="tablist" aria-orientation="vertical">
        ';
        $subs = Subpackage::getPackage_limit($pkgRec->id);
        if (!empty($subs)) {
            foreach ($subs as $j => $sub) {
                $active = ($j == 0) ? 'active' : '';
                $ariaSelect = ($j == 0) ? 'true' : 'false';
                $packagedetail .= '
                    <a class="nav-link ' . $active . '" id="v-pills-' . $sub->slug . '-tab" data-toggle="pill"  href="#v-pills-' . $sub->slug . '" 
                        role="tab" aria-controls="v-pills-' . $sub->slug . '" aria-selected="' . $ariaSelect . '">
                        ' . ($sub->title) . '
                        <span><i class="fas fa-long-arrow-alt-right"></i></span>
                    </a>
                ';
            }
        }
        $packagedetail .= '
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="tab-content" id="v-pills-tabContent">
        ';
        if (!empty($subs)) {
            foreach ($subs as $j => $sub) {
                $active = ($j == 0) ? 'active' : '';
                $show = ($j == 0) ? 'show' : '';
                $packagedetail .= '
                    <div class="tab-pane fade ' . $show . ' ' . $active . '" id="v-pills-' . $sub->slug . '" role="tabpanel" aria-labelledby="v-pills-' . $sub->slug . '-tab">
                        ' . ($sub->content) . '
                    </div>
                ';
            }
        }
        $packagedetail.='
                    </div>
                </div>
            </div>
        ';
    } else {
        redirect_to(BASE_URL . 'home');
    }
}

$jVars['module:package:package-detail'] = $packagedetail;
$jVars['module:package:package-bred'] = $packagebread;


/**
 *          Sub Package Detail Page
 */
$subpackageBread = $subpackageDetails = $subpackageImage = '';

if (defined('SUBPACKAGE_PAGE') and isset($_REQUEST['slug'])) {
    $slug = !empty($_REQUEST['slug']) ? addslashes($_REQUEST['slug']) : '';
    $subpkgRec = Subpackage::find_by_slug($slug);

    if (!empty($subpkgRec)) {

        $imgSrc = BASE_URL . 'template/web/assets/img/default-banner.jpg';
        $file_path = SITE_ROOT . 'images/subpackage/image/' . $subpkgRec->banner_image;
        if (file_exists($file_path) and !empty($subpkgRec->banner_image)) {
            $imgSrc = IMAGE_PATH . 'subpackage/image/' . $subpkgRec->banner_image;
        }

        $subpackageBread .= '
            <section class="breadcrumb-area" style="background-image: url(' . $imgSrc . ');">
                <div class="container">
                    <div class="breadcrumb-text">
                        <!-- <h2 class="page-title">Services</h2> -->
                        <div class="row">
                            <div class="col-lg-4">
                                <h4>' . FOOTER_FREE_ASSESSMENT . '</h4>
                            </div>
                            <div class="col-lg-4">
                                <h4><a href="' . BASE_URL . 'contact-us">' . FOOTER_RESERVE . '</a></h4>
                            </div>
                        </div>
            
                        <ul class="breadcrumb-nav">
                            <!-- <li><a href="index.html">Home</a></li> -->
                            <li class="active">' . ($subpkgRec->title) . '</li>
                        </ul>
                    </div>
                </div>
            </section>
        ';

        $class = 'pb-90';
        $extraContent = $subpkgRec->sub_title;
        if (!empty($extraContent)) {
            $class = '';
        }
        $subpackageDetails .= '
            <section class="room-details pt-120 ' . $class . '">
                <div class="container">
                    <div class="row">
                        <!-- details -->
                        <div class="col-lg-4">
                            <div class="deatils-box">
                                <div class="cancellation-box clearfix mb-60">
                                    ' . ($subpkgRec->brief) . '
                                </div>
                            </div>
                        </div>
            
                        <div class="col-lg-8">
                            <div class="deatils-box">
                                <div class="cancellation-box clearfix">
                                    ' . ($subpkgRec->content) . '
                                </div>
                            </div>
                        </div>
        ';
        $image2 = $subpkgRec->image2;
        $file_path = SITE_ROOT . 'images/subpackage/image2/' . $image2;
        $subpackageDetails .= (file_exists($file_path) and !empty($image2))
            ? '<div class="col-lg-12"><img src="' . IMAGE_PATH . 'subpackage/image2/' . $image2 . '" alt="' . ($subpkgRec->title) . '"></div>'
            : '';
        $subpackageDetails .= '
                    </div>
                </div>
            </section>
        ';

        if (!empty($extraContent)) {
            $subpackageDetails .= '
                <section class="blog-section pt-120 pb-120">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-12">
                                <div class="news-details-box">
                                    ' . ($subpkgRec->sub_title) . '
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            ';
        }
    }

}

$jVars['module:package:sub-package-bread'] = $subpackageBread;
$jVars['module:package:sub-package-image'] = $subpackageImage;
$jVars['module:package:sub-package-details'] = $subpackageDetails;


/**
 *          Product Package page
 */
$package_bread = $package_detail = $pkg_add_to_cart_modal = $pkg_add_to_cart_script = '';

if (defined('PACKAGES_PAGE')) {
    $package_bread .= '
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

    $mainProducts = Product::find_all_by_type(2);

    $package_detail .= '
        <div class="ltn__tab-menu ltn__tab-menu-2 ltn__tab-menu-top-right-- text-uppercase text-center">
            <div class="row">
                <div class="col-md-3">
                    <div class="nav row" id="myTab" style="display:grid;">
                ';
    foreach ($mainProducts as $i => $mainProduct) {
        $activeShow = ($i == 0) ? 'active show' : '';
        $package_detail .= '
            <a class="' . $activeShow . '" data-toggle="tab" href="#product_' . $mainProduct->slug . '">' . ($mainProduct->title) . '</a>
        ';
    }
    $package_detail .= '</div>
            </div>
        
        <div class="col-md-9">
        <div class="tab-content tab-list3">
    ';
    foreach ($mainProducts as $i => $mainProduct) {
        $activeShow = ($i == 0) ? 'active show' : '';
        if ($mainProduct->id == 1111111111111) {
            $package_detail .= '
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

                    $package_detail .= '
                        <div class="col-lg-6">
                            <div class="ltn__product-item ltn__product-item-3">
                                <div class="product-img">
                                    <img src="' . $img . '" alt="' . ($product->title) . '">
                                    <div class="product-badge">
                                        <ul>
                    ';
                    if (!empty($product->tag)) {
                        $package_detail .= '<li class="sale-badge">' . $product->tag . '</li>';
                    }
                    $package_detail .= '
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h2 class="product-title">
                                        <a href="' . BASE_URL . 'product/' . $product->slug . '">' . ($product->title) . '</a>
                                    </h2>
                                    <div class="product-price">
                    ';
                    if (!empty($product->discount1) or $product->discount1 > 0) {
                        $package_detail .= '<span>' . $product->currency . ' ' . sprintf('%.2f', $product->discount1) . '</span>
                                    <del>' . $product->currency . ' ' . sprintf('%.2f', $product->price1) . '</del>';
                    } else {
                        $package_detail .= '<span>' . $product->currency . ' ' . sprintf('%.2f', $product->price1) . '</span>';
                    }
                    $cont = $product->content;
                    $hrid = '';
                    $rescont = explode('<hr id="system_readmore' . $hrid . '" style="border-style: dashed; border-color: orange;" />', $cont);
                    $package_detail .= '
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

                    $pkg_add_to_cart_script .= '
                        <script>
                            $("#quick_view_modal_product_' . $product->slug . '").on("shown.bs.modal", function () {
                              $(".ltn__blog-slider-one-active1").slick("setPosition");
                            })
                        </script>
                    ';

                    // Add to cart modal (Quick View Modal)
                    $pkg_add_to_cart_modal .= '
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
                                $pkg_add_to_cart_modal .= '
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
                    $pkg_add_to_cart_modal .= '
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-7 col-12">
                                                            <div class="modal-product-info">
                                                                <h3>' . ($product->title) . '</h3>
                                                                ' . ($product->brief) . '
                    
                        <div class="shoping-cart-table table-responsive">
                            <form id="add-cart-product-' . $product->slug . '">
                            <table class="table">
                                <tbody>
                                
                                    <tr>
                                        <td class="cart-product-info">
                                            <div class="form-check form-check-inline">
                    ';
                    if (!empty($product->qnt2)) {
                        $pkg_add_to_cart_modal .= '<input class="form-check-input" type="checkbox" name="product_check[]" value="1">';
                    } else {
                        $pkg_add_to_cart_modal .= '<input class="form-check-input" type="hidden" name="product_check[]" checked value="1">';
                    }
                    $prodPrice = (!empty($product->discount1) and $product->discount1 > 0) ? $product->discount1 : $product->price1;
                    $pkg_add_to_cart_modal .= '
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
                                            <input type="hidden" name="product_total_1" class="product_total" value="0">
                                            <h6 class="product-sub-total">' . $product->currency . ' ' . $prodPrice . '</h6>
                                        </td>
                                    </tr>
                                    
                    ';

                    if (!empty($product->qnt2)) {
                        $prodPrice = (!empty($product->discount2) and $product->discount2 > 0) ? $product->discount2 : $product->price2;
                        $pkg_add_to_cart_modal .= '
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
                        $pkg_add_to_cart_modal .= '
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
                        $pkg_add_to_cart_modal .= '
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

                    $pkg_add_to_cart_modal .= '
                                    
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
        <a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/' . $product->slug . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                                                        </li>
                                                                        <li>
        <a href="https://twitter.com/share?url=' . BASE_URL . 'product/' . $product->slug . '&text=' . ($product->title) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                                                        </li>
                                                                        <li>
        <a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/' . $product->slug . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
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
            $package_detail .= '
                        </div>
                    </div>
                </div>
            ';
        } else {
            $package_detail .= '
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

                    $package_detail .= '
                        <div class="col-xl-4 col-sm-6 col-6">
                            <div class="ltn__product-item ltn__product-item-3 text-center">
                                <div class="product-img product_hove" data-href="' . BASE_URL . 'product/' . $product->slug . '">
                                    <img src="' . $img . '" alt="' . ($product->title) . '">
                                    <div class="product-badge">
                                        <ul>
                    ';
                    if (!empty($product->tag)) {
                        $package_detail .= '<li class="sale-badge">' . $product->tag . '</li>';
                    }
                    $package_detail .= '
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
                                        <a href="' . BASE_URL . 'product/' . $product->slug . '">' . ($product->title) . '</a>
                                    </h2>
                                    <div class="product-price">
                    ';
                    if (!empty($product->discount1) or $product->discount1 > 0) {
                        $package_detail .= '<span>' . $product->currency . ' ' . sprintf('%.2f', $product->discount1) . '</span>
                                    <del>' . $product->currency . ' ' . sprintf('%.2f', $product->price1) . '</del>';
                    } else {
                        $package_detail .= '<span>' . $product->currency . ' ' . sprintf('%.2f', $product->price1) . '</span>';
                    }
                    $package_detail .= '
                                    </div>
                                </div>
                            </div>
                        </div>
                    ';

                    $pkg_add_to_cart_script .= '
                        <script>
                            $("#quick_view_modal_product_' . $product->slug . '").on("shown.bs.modal", function () {
                              $(".ltn__blog-slider-one-active1").slick("setPosition");
                            })
                        </script>
                    ';

                    // Add to cart modal (Quick View Modal)
                    $pkg_add_to_cart_modal .= '
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
                                $pkg_add_to_cart_modal .= '
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
                    $pkg_add_to_cart_modal .= '
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-7 col-12">
                                                            <div class="modal-product-info">
                                                                <h3>' . ($product->title) . '</h3>
                                                                ' . ($product->brief) . '
                    
                        <div class="shoping-cart-table table-responsive">
                            <form id="add-cart-product-' . $product->slug . '">
                            <table class="table">
                                <tbody>
                                
                                    <tr>
                                        <td class="cart-product-info">
                                            <div class="form-check form-check-inline">
                    ';
                    if (!empty($product->qnt2)) {
                        $pkg_add_to_cart_modal .= '<input class="form-check-input" type="checkbox" name="product_check[]" value="1">';
                    } else {
                        $pkg_add_to_cart_modal .= '<input class="form-check-input" type="hidden" name="product_check[]" checked value="1">';
                    }
                    $prodPrice = (!empty($product->discount1) and $product->discount1 > 0) ? $product->discount1 : $product->price1;
                    $pkg_add_to_cart_modal .= '
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
                                            <input type="hidden" name="product_total_1" class="product_total" value="0">
                                            <h6 class="product-sub-total">' . $product->currency . ' ' . $prodPrice . '</h6>
                                        </td>
                                    </tr>
                                    
                    ';

                    if (!empty($product->qnt2)) {
                        $prodPrice = (!empty($product->discount2) and $product->discount2 > 0) ? $product->discount2 : $product->price2;
                        $pkg_add_to_cart_modal .= '
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
                        $pkg_add_to_cart_modal .= '
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
                        $pkg_add_to_cart_modal .= '
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

                    $pkg_add_to_cart_modal .= '
                                    
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
        <a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/' . $product->slug . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                                                        </li>
                                                                        <li>
        <a href="https://twitter.com/share?url=' . BASE_URL . 'product/' . $product->slug . '&text=' . ($product->title) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                                                        </li>
                                                                        <li>
        <a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/' . $product->slug . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
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
            $package_detail .= '
                        </div>
                    </div>
                </div>
            ';
        }
    }
    $package_detail .= '
        </div></div></div>
    ';
}

$jVars['module:package:package-bread'] = $package_bread;
$jVars['module:package:package-detail'] = $package_detail;
$jVars['module:package:package-add-to-cart-modal'] = $pkg_add_to_cart_modal;
$jVars['module:package:package-add-to-cart-script'] = $pkg_add_to_cart_script;
