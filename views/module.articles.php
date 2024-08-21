<?php
$resinndetail = $imageList = $innerBread = '';
$article_gift_sets_modal='';
$article_gift_sets_script='';
if (defined('INNER_PAGE') and isset($_REQUEST['slug'])) {

    $slug = addslashes($_REQUEST['slug']);
    $recRow = Article::find_by_slug($slug);
    if($recRow->prodcategory==0 && $recRow->Subcategory==0 && $recRow->service_id==0){
    if (!empty($recRow)) {

        $img = BASE_URL . 'template/web/img/bg/5.jpg';
        if ($recRow->image != "a:0:{}") {
            $imageList = unserialize($recRow->image);
            $file_path = SITE_ROOT . 'images/articles/' . $imageList[0];
            if (file_exists($file_path)) {
                $img = IMAGE_PATH . 'articles/' . $imageList[0];
            }
        }
    
        $ttitle = $recRow->title;
        $innerBread .= '
            <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-image" data-bg="' . $img . '">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                                <div class="section-title-area ltn__section-title-2">
                                    <h1 class="section-title white-color"><strong>' . $ttitle . '</strong></h1>
                                </div>
        ';
        if ($recRow->id == 1) {
            $innerBread .= '
                                <div class="ltn__breadcrumb-list">
                                    <a href="https://www.agrosexperience.com/" target="_blank"><button type="submit" class="btn theme-btn-1 btn-effect-1 text-uppercase">' . ARTICLE_BOOK_YOUR_TOUR . '</button></a>
                                </div>
            ';
        }
        $innerBread .= '
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        ';

    
        $rescontent = explode('<hr id="system_readmore" style="border-style: dashed; border-color: orange;" />',
            trim(($recRow->content)));
        $content = (!empty($rescontent[1])) ? $rescontent[1] : $rescontent[0];
        $resinndetail .= '  <div class="about-article">
                                <div class="container">
                                    '.$content.'
                                </div>
                            </div>';
    } else {
        redirect_to(BASE_URL);
    }
}
else{

    $resinndetail .= '
    <div class="ltn__utilize-overlay"></div>

    <div class="about-article">
        <div class="container mx-auto">
            <div class="row">
                <div class="col-md-9 product-filter-right">
                    <h4>'.$recRow->title.'</h4>
                    <p>'.$recRow->content.'</p>
                </div>

                <div class="col-md-3">
                    <div class="related-topic-title">
                    <h4>Related Topic</h4>
                    ';
                            $menurelarticles = Article::menudetailArticle($recRow->prodcategory, $recRow->Subcategory, $recRow->service_id, $recRow->id);
                        //    pr($recRow->id);
                            $resinndetail .= '
                            <ul class="note-link-title">';
                            foreach($menurelarticles as $menurelarticle){
                            $resinndetail .= '
                                <li><a href="'.BASE_URL.$menurelarticle->slug.'">'.$menurelarticle->title.'</a></li>
                                 ';
                        }
                         $resinndetail .= '</ul>';
                         $relatedproducts= SubProduct::menuproduct($recRow->prodcategory, $recRow->Subcategory, $recRow->service_id);
                        //  pr($relatedproducts);
                       $resinndetail .= ' </li>
                    </ul>
                    </div>
                </div>
            </div>

            <div class="space"></div>

            <div class="row" style="margin-bottom:15px;">
                <div class="col-md-12 product-filter-right">
                    <h2><div id="searchtitle">Related products</div></h2>
                    
                    <div id="productContainer" class="row">';
                    foreach($relatedproducts as $rows){

                        $price_text = '';
                    if (!empty($rows->price1) and (empty($rows->offer_price))) {
                        $price_text = '<span>' . $rows->currency . ' ' . $rows->price1 . '</span>';
                    }
                    if (!empty($rows->discount1)) {
                        $discountamt= $rows->price1 - $rows->discount1;
                        $price_text = '
                        <span>' . $rows->currency . ' '.$rows->discount1.'</span>|<span>' . $rows->discountedp . '%off</span><br/>
                                <del>' . $rows->currency . ' ' . $rows->price1 . '</del> <span class="font-14">Save ' . $rows->currency . ' ' . $discountamt. '</span> 
                        
                        ';
                    }
                        $product = SubProduct::find_by_slug($rows->slug);
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
                        $prodbrand = Brand::find_by_id($rows->brand);
                    $prodservice = Services::find_by_id($rows->service_id);
                    if (!empty($prodbrand)) {
                        $titlebrand = $prodbrand->title;
                        $slug = $prodbrand->slug;
                    } else {
                        $titlebrand = '';
                        $slug = '';
                    }
                    if (!empty($prodservice)) {
                        $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $rows->slug . '';
                    } else {
                        $slugs = '' . BASE_URL . 'product/product-detail/' . $rows->slug . '';;
                    }
                      $resinndetail .= '
                        <div class="col-xl-3 col-sm-6 col-6">
                            <div class="ltn__product-item ltn__product-item-3 text-center">
                                <a href="' . $slugs . '"><div class="product-img product_hove" data-href="' . $slugs . '">
                                    <img src="' . $img . '" alt="' . $rows->title . '">
                                </div></a>
                                <div class="product-info">
                                    <h4 class="product-title"><a href="' . BASE_URL . 'search/' . $slug . '" class="product-link">' . $titlebrand . '</a></h4>
                                    <a href="' . $slugs . '" class="product-link">' . $rows->title . '</a>
                                    <div class="product-price">
                                        ' . $price_text . '
                                    </div>
                                    <div class="product-action">
                    ';
                    if (!empty($rows->tag)) {
                        $resinndetail .= '<li class="sale-badge">' .substr($rows->tag,0,70) . '</li>';
                    }
                    $resinndetail .= '
                                        <ul>
                                            <li>
                                                <a href="#" class="add-wishlist"
                                                    title="Add to Wishlist"
                                                    data-cartid="' . $rows->slug . '">
                                                    <i class="far fa-heart"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" title="ADD TO CART"
                                                    class="add-to-cart" data-toggle="modal"
                                                    data-target="#quick_view_modal_product_' . $rows->slug  . '">
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
// pr($rows);
                    $article_gift_sets_script .= '
                <script>
                    $("#quick_view_modal_product_' . $rows->slug . '").on("shown.bs.modal", function () {
                      $(".ltn__blog-slider-one-active1").slick("setPosition");
                    })
                </script>
            ';

            $article_gift_sets_modal .= '
                <div class="ltn__modal-area ltn__quick-view-modal-area">
                    <div class="modal fade" id="quick_view_modal_product_' . $rows->slug . '" tabindex="-1">
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
            $sliderImages = SubProductImage::getImagelist_by($rows->id);
            if (!empty($sliderImages)) {
                foreach ($sliderImages as $sliderImage) {
                    $file_path = SITE_ROOT . 'images/product/galleryimages/' . $sliderImage->image;
                    if (file_exists($file_path)) {
                        $article_gift_sets_modal .= '
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
            
            $article_gift_sets_modal .= '
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-7 col-12">
                                                    <div class="modal-product-info">
                                                    <h4 class="product-title"><a href="' . BASE_URL . 'search/' . $slug. '" class="product-link">' . $titlebrand . '</a></h4>
                                                        <h3>' . (($lang == "gr") ? $rows->title_greek : $rows->title) . '</h3>
                                                        ' . (($lang == "gr") ? $rows->brief_greek : $rows->brief) . '

                                                            <br/>
                                                            <br/>

                                                            <a href="' . $slugs . '" class="" style="font-size: 0.85em; text-decoration: underline; text-transform: capitalize; color: #0E75BA ;">
                                                                <span>' . SHOP_VIEW_MORE . '</span>
                                                            </a>
            
                <div class="shoping-cart-table table-responsive">
                    <form id="add-cart-product-' . $rows->slug . '">
                    <table class="table">
                        <tbody>
                        
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
            ';
            if (!empty($rows->qnt2)) {
                $article_gift_sets_modal .= '<input class="form-check-input" type="checkbox" name="product_check[]" value="1">';
            } else {
                $article_gift_sets_modal .= '<input class="form-check-input" type="hidden" name="product_check[]" checked value="1">';
            }
            $prodPrice = (!empty($rows->discount1) and $rows->discount1 > 0) ? $rows->discount1 : $rows->price1;
            $article_gift_sets_modal .= '
                                        <input type="hidden" name="product_qnt_1" value="' . $rows->qnt1 . '">
                                        <input type="hidden" name="product_net_qnt_1" value="' . $rows->netqnt1 . '">
                                        <label class="form-check-label">' . $rows->netqnt1 . '</label>
                                    </div>
                                </td>
                               
                                <td class="cart-product-price">
                                <input type="hidden" name="product_price_1" value="' . $prodPrice . '">
                                
                                ' . $rows->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                <span>QTY</span
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybuttonadd">-</div>
                                        <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $rows->currency . '" readonly>
                                        <div class="inc qtybuttonadd">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_1" class="product_total" value="' . $prodPrice . '">
                                    <h6 class="product-sub-total">' . $rows->currency . ' ' . sprintf("%.2f",$prodPrice) . '</h6>
                                </td>
                            </tr>
                            
            ';

            if (!empty($rows->qnt2)) {
                $prodPrice = (!empty($rows->discount2) and $rows->discount2 > 0) ? $rows->discount2 : $rows->price2;
                $article_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="2">
                                        <input type="hidden" name="product_qnt_2" value="' . $rows->qnt2 . '">
                                        <input type="hidden" name="product_net_qnt_2" value="' . $rows->netqnt2 . '">
                                        <label class="form-check-label">' . $rows->netqnt2 . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_2" value="' . $prodPrice . '">
                                    ' . $rows->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="0" min="0" step="1" name="product_qty_2" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $rows->currency . '" readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_2" class="product_total" value="0">
                                    <h6 class="product-sub-total">' . $rows->currency . ' 0.00</h6>
                                </td>
                            </tr>
                ';
            }

            if (!empty($rows->qnt3)) {
                $prodPrice = (!empty($rows->discount3) and $rows->discount3 > 0) ? $rows->discount3 : $rows->price3;
                $article_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="3">
                                        <input type="hidden" name="product_qnt_3" value="' . $rows->qnt3 . '">
                                        <input type="hidden" name="product_net_qnt_3" value="' . $rows->netqnt3 . '">
                                        <label class="form-check-label">' . $rows->netqnt3 . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_3" value="' . $prodPrice . '">
                                    ' . $rows->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="0" min="0" step="1" name="product_qty_3" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $rows->currency . '" readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_3" class="product_total" value="0">
                                    <h6 class="product-sub-total">' . $rows->currency . ' 0.00</h6>
                                </td>
                            </tr>
                ';
            }

            if (!empty($rows->qnt4)) {
                $prodPrice = (!empty($rows->discount4) and $rows->discount4 > 0) ? $rows->discount4 : $rows->price4;
                $article_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="4">
                                        <input type="hidden" name="product_qnt_4" value="' . $rows->qnt4 . '">
                                        <input type="hidden" name="product_net_qnt_4" value="' . $rows->netqnt4 . '">
                                        <label class="form-check-label">' . $rows->netqnt4 . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_4" value="' . $prodPrice . '">
                                    ' . $rows->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="0" min="0" step="1" name="product_qty_4" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $rows->currency . '" readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_4" class="product_total" value="0">
                                    <h6 class="product-sub-total">' . sprintf("%.2f",$rows->currency) . ' 0.00</h6>
                                </td>
                            </tr>
                ';
            }

            $article_gift_sets_modal .= '
                            
                        </tbody>
                    </table>
                    </form>
                </div>
                                                        <div class="ltn__product-details-menu-2">  
                                                            <ul>
                                                            <li style="padding-right: 16.28rem;">
                                                            <a href="#" class="add-wishlist theme-btn-2 btn btn-effect-2 add-cart" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $rows->slug . '">
                                                                <i class="far fa-heart"></i>
                                                               <!-- <span>' . SHOP_ADD_TO_WISHLIST . '</span> -->
                                                            </a>
                                                        </li>
                                                            
                                                                <li>
                                                                    <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="' . SHOP_ADD_TO_CART . '" data-cartid="' . $rows->slug . '" form-id="add-cart-product-' . $rows->slug . '">
                                                                        <i class="fas fa-shopping-cart"></i>
                                                                        <span>' . SHOP_ADD_TO_CART . '</span>
                                                                    </a>
                                                                </li>
                                                              
                                                                
                                                                <!--<li>
                                                                <a href="' . BASE_URL . 'checkout" class="theme-btn-1 btn btn-effect-1"> <i class="fas fa-sign-out-alt"></i> ' . HOME_CHECKOUT . '</a>
                                                                </li>-->

                                                               
                                                               
                                                            </ul>
                                                        </div>
                                                        <hr>
                                                        <div class="ltn__social-media">
                                                            <ul>
                                                                <li>' . SHOP_SHARE . ':</li>
                                                                <li>
<a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/product-detail/' . $rows->slug . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                                                </li>
                                                                <li>
<a href="https://twitter.com/share?url=' . BASE_URL . 'product/product-detail/' . $rows->slug . '&text=' . (($lang == 'gr') ? $rows->title_greek : $rows->title) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                                                </li>
                                                                <li>
<a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/product-detail/' . $rows->slug . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
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
                   $resinndetail .= '  </div>
                </div>
            </div>';
            if($recRow->service_id != 0){
                $servicerelated = Services::find_by_id($recRow->service_id);
                $slugother= ''.BASE_URL.'product/'.$servicerelated->slug.'';
            }
            
            $resinndetail .= ' <a href="'.BASE_URL.'search" class="article-botton">View All</a>
        </div>
    </div>

<div id="productpopup">
</div>';
// pr($row);


}
}

$jVars['module:article:inner-detail'] = $resinndetail;
$jVars['module:article:inner-modal'] = $article_gift_sets_modal;
$jVars['module:article:inner-script'] = $article_gift_sets_script;
$jVars['module:article:inner-bread'] = $innerBread;


/**
 *      Home page
 */
$resinnh = '';

if (defined('HOME_PAGE')) {
    $recInn = Article::homepageArticle();

    if (!empty($recInn)) {
        foreach ($recInn as $innRow) {
            $contentinfc = explode('<hr id="system_readmore" style="border-style: dashed; border-color: orange;" />', trim($innRow->content));
            $contentinfcgreek = explode('<hr id="system_readmore" style="border-style: dashed; border-color: orange;" />', trim($innRow->content_greek));
            $readmoreinfc = (count($contentinfc) > 1) ? '<a href="' . BASE_URL . 'page/' . $innRow->slug . '" class="ravis-btn btn-type-2">Read More</a>' : '';
            $readmore = '';
            if (!empty($innRow->linksrc)) {
                $linkTarget = ($innRow->linktype == 1) ? ' target="_blank" ' : '';
                $linksrc = ($innRow->linktype == 1) ? $innRow->linksrc : BASE_URL . $innRow->linksrc;
                $readmore = '<a href="' . $linksrc . '" title="">see more</a>';
            } /*else {
        $readmore = (count($content) > 1) ? '<a href="' . BASE_URL .'' .$innRow->slug . '" title="">Read more...</a>' : '';
    }*/

            $resinnh .= ($contentinfc[0]);
        }
    }

}

$jVars['module:home-article'] = $resinnh;


$restyp = '';

$typRow = Article::get_by_type();
if (!empty($typRow)) {
    $content = explode('<hr id="system_readmore" style="border-style: dashed; border-color: orange;" />', trim($typRow->content));
    $readmore = '';
    if (!empty($typRow->linksrc)) {
        $linkTarget = ($typRow->linktype == 1) ? ' target="_blank" ' : '';
        $linksrc = ($typRow->linktype == 1) ? $typRow->linksrc : BASE_URL . $typRow->linksrc;
        $readmore = '<a class="text-link link-direct" href="' . $linksrc . '">see more</a>';
    } else {
        $readmore = (count($content) > 1) ? '<a href="' . BASE_URL . $typRow->slug . '">Read more...</a>' : '';
    }
    $restyp .= '<h3 class="h3 header-sidebar">' . $typRow->title . '</h3>
	<div class="home-content">
		' . $content[0] . ' ' . $readmore . '
	</div>';

}

$jVars['module:article_by_type'] = $restyp;
?>