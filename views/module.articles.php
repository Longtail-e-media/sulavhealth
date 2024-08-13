<?php
$resinndetail = $imageList = $innerBread = '';

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
        $resinndetail .= '<div class="container about mt-5 ">
        <div class="row pt-60 pb-120">'.$content.'
         </div>
    </div>
        ';
    } else {
        redirect_to(BASE_URL);
    }
}
else{

    $resinndetail .= '
    <div class="ltn__utilize-overlay"></div>

<div class="container mx-auto product-filter">
    <div class="row">
        <div class="col-md-12 product-filter-right">
        <li class="first-mega">'.$recRow->title.'
                            <ul>
                                <li>'.$recRow->content.'</li>
                            </ul>
                            ';
                            $menurelarticles = Article::menuArticle($recRow->prodcategory, $recRow->Subcategory, $recRow->service_id);
                            $resinndetail .= '
                            <ul class="note-link">';
                            foreach($menurelarticles as $menurelarticle){
                            $resinndetail .= '
                                <li><a href="'.BASE_URL.$menurelarticle->slug.'">'.$menurelarticle->title.'</a></li>
                                 ';
                        }
                         $resinndetail .= '</ul>';
                         $relatedproducts= SubProduct::menuproduct($recRow->prodcategory, $recRow->Subcategory, $recRow->service_id);
                        //  pr($relatedproducts);
                       $resinndetail .= ' </li>


        </div>
    </div>

    <div class="row">
        <div class="col-md-12 product-filter-right">
            <h2><div id="searchtitle">related products</div></h2>
            
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
                $resinndetail .= '<li class="sale-badge">' . $rows->tag. '</li>';
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
        }
           $resinndetail .= '  </div>
        </div>
    </div>';
    if($recRow->service_id != 0){
        $servicerelated = Services::find_by_id($recRow->service_id);
        $slugother= ''.BASE_URL.'product/'.$servicerelated->slug.'';
    }
    
    $resinndetail .= ' <a href="'.$slugother.'">view more</a>

</div>
</div>
</div>

<div id="productpopup">
</div>';
}
}

$jVars['module:article:inner-detail'] = $resinndetail;
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