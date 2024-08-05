<?php
$resinndetail = $imageList = $innerBread = '';

if (defined('INNER_PAGE') and isset($_REQUEST['slug'])) {

    $slug = addslashes($_REQUEST['slug']);
    $recRow = Article::find_by_slug($slug);
    
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
        $resinndetail .= $content;
    } else {
        redirect_to(BASE_URL);
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