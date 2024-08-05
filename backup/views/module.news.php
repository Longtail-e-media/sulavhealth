<?php

/**
 *          NEWS LIST PAGE
 */

$nnews = $nbread = $npage = '';

if (defined('NEWS_LIST_PAGE')) {

    $nbread .= '
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-image" data-bg="' . BASE_URL . 'template/web/img/banner/005-cut-2.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                            <div class="section-title-area ltn__section-title-2">
                                <h1 class="section-title white-color"><strong>' . NEWS_NEWS . '</strong></h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    ';

    /*
    $page = (isset($_REQUEST["pageno"]) and !empty($_REQUEST["pageno"])) ? $_REQUEST["pageno"] : 1;
    $sql = "SELECT * FROM tbl_news WHERE status='1' ORDER BY news_date DESC";
    $limit = 9;
    $total = $db->num_rows($db->query($sql));
    $startpoint = ($page * $limit) - $limit;
    $sql .= " LIMIT " . $startpoint . "," . $limit;
    $query = $db->query($sql);
    $Records = News::find_by_sql($sql);
    if (!empty($Records)) {
        foreach ($Records as $key => $RecRow) {
            $img = BASE_URL . 'template/web/img/blog/olive.jpg';
            $file_path = SITE_ROOT . 'images/news/' . $RecRow->image;
            if (file_exists($file_path) and !empty($RecRow->image)) {
                $img = IMAGE_PATH . 'news/' . $RecRow->image;
            }
            $nnews .= '
                <div class="col-lg-4 col-sm-6 col-12">
                    <div class="ltn__blog-item ltn__blog-item-3">
                        <div class="ltn__blog-img">
                            <a href="' . BASE_URL . 'news/' . $RecRow->slug . '">
                                <img src="' . $img . '" alt="' . $RecRow->title . '">
                            </a>
                        </div>
                        <div class="ltn__blog-brief">
                            <div class="ltn__blog-meta">
                                <ul>
                                    <li class="ltn__blog-author">
                                        <a href="javascript:;">
                                            <i class="far fa-user"></i>' . NEWS_BY_SMALL . ': ' . $RecRow->author . '
                                        </a>
                                    </li>
            ';
            $tag = ($lang == "gr") ? $RecRow->brief_greek : $RecRow->brief;
            if (!empty($tag)) {
                $nnews .= '
                                    <li class="ltn__blog-tags">
                                        <a href="javascript:;"><i class="fas fa-tags"></i>' . $tag . '</a>
                                    </li>
                ';
            }
            $nnews .= '
                                </ul>
                            </div>
                            <h3 class="ltn__blog-title">
                                <a href="' . BASE_URL . 'news/' . $RecRow->slug . '">' . (($lang == "gr") ? $RecRow->title_greek : $RecRow->title) . '</a>
                            </h3>
                            <div class="ltn__blog-meta-btn">
                                <div class="ltn__blog-meta">
                                    <ul>
                                        <li class="ltn__blog-date"><i class="far fa-calendar-alt"></i>' . date('F d, Y', strtotime($RecRow->news_date)) . '</li>
                                    </ul>
                                </div>
                                <div class="ltn__blog-btn">
                                    <a href="' . BASE_URL . 'news/' . $RecRow->slug . '">' . PACKAGE_READ_MORE . '</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            ';
        }
        $npage .= get_front_pagination($total, $limit, $page, BASE_URL . 'news');
    } else {
        $nnews .= '
            <div class="col-md-12"><h1>No News Found</h1></div>
        ';
    }
    */

    $cats = NewsCategory::find_all_active();
    if (!empty($cats)) {
        $nnews .= '
            <div class="col-md-4">
                <div class="nav flex-column nav-pills widget ltn__menu-widget sticky" id="v-pills-tab" role="tablist" aria-orientation="vertical">
        ';
        foreach ($cats as $k => $cat) {
            $active = ($k == 0) ? 'active' : '';
            $asel = ($k == 0) ? 'true' : 'false';
            $nnews .= '
                <a class="nav-link ' . $active . '" id="v-pills-' . $cat->slug . '-tab" data-toggle="pill" href="#v-pills-' . $cat->slug . '" role="tab" aria-controls="v-pills-home" aria-selected="' . $asel . '">' . $cat->title . '<span><i class="fas fa-long-arrow-alt-right"></i></span></a>
            ';
        }
        $nnews .= '
                </div>
            </div>
            <div class="col-md-8">
                <div class="tab-content" id="v-pills-tabContent">
        ';
        foreach ($cats as $k => $cat) {
            $active = ($k == 0) ? 'active' : '';
            $show = ($k == 0) ? 'show' : '';
            $nnews .= '
                <div class="tab-pane fade ' . $active . ' ' . $show . '" id="v-pills-' . $cat->slug . '" role="tabpanel" aria-labelledby="v-pills-' . $cat->slug . '-tab">
                    <div class="row">
            ';
            $newsRecs = News::find_by_sql("SELECT * FROM tbl_news WHERE status=1 AND cat_id='{$cat->id}' ORDER BY sortorder DESC");
            if (!empty($newsRecs)) {
                foreach ($newsRecs as $newsRec) {
                    $nnews .= '
                        <div class="col-lg-6 col-sm-6 col-12">
                            <div class="ltn__blog-item ltn__blog-item-3">
                                <div class="ltn__blog-brief">
                                    <div class="ltn__blog-meta">
                                        <ul>
                                            <li class="ltn__blog-author">
                                                <i class="far fa-user"></i>by: ' . $newsRec->author . '
                                            </li>
                                        </ul>
                                    </div>
                                    <h3 class="ltn__blog-title animated fadeIn"><a href="' . BASE_URL . 'news/' . $newsRec->slug . '">' . $newsRec->title . '</a></h3>
                                    <div class="ltn__blog-meta-btn">
                                        <div class="ltn__blog-meta">
                                            <ul>
                                                <li class="ltn__blog-date"><i class="far fa-calendar-alt"></i>' . date('F d, Y', strtotime($newsRec->news_date)) . '</li>
                                            </ul>
                                        </div>
                                        <div class="ltn__blog-btn">
                                            <a href="' . BASE_URL . 'news/' . $newsRec->slug . '">Read more</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    ';
                }
            }
            $nnews .= '
                    </div>
                </div>
            ';
        }
        $nnews .= '
                </div>
            </div>    
        ';
    } else {
        $nnews .= '<div class="col-md-12"><h1>No News Found</h1></div>';
    }
}

$jVars['module:news:news-list'] = $nnews;
$jVars['module:news:news-list-pagination'] = $npage;
$jVars['module:news:new-list-bred'] = $nbread;


/**
 *          NEWS DETAIL PAGE
 */

$renewsdetail = $newsbread = '';

if (defined('NEWS_PAGE') and isset($_REQUEST['slug'])) {

    $slug = !empty($_REQUEST['slug']) ? addslashes($_REQUEST['slug']) : '';
    $detspRec = News::find_by_slug($slug);

    if (!empty($detspRec)) {

        $banner_img = BASE_URL . 'template/web/img/banner/005-cut-2.jpg';
        $file_path = SITE_ROOT . 'images/news/banner/' . $detspRec->banner_image;
        if (file_exists($file_path) and !empty($detspRec->banner_image)) {
            $banner_img = IMAGE_PATH . 'news/banner/' . $detspRec->banner_image;
        }

        $newsbread .= '
            <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-image" data-bg="' . $banner_img . '">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                                <div class="section-title-area ltn__section-title-2">
                                    <h1 class="section-title white-color"><strong>' . NEWS_NEWS_DETAILS . '</strong></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        ';

        $renewsdetail .= '
            <div class="row">
                <div class="col-lg-8">
                    <div class="ltn__blog-details-wrap">
                        <div class="ltn__page-details-inner ltn__blog-details-inner">
                            <h2 class="ltn__blog-title">' . $detspRec->title . '</h2>
                            <div class="ltn__blog-meta">
                                <ul>
                                    <li class="ltn__blog-author">
                                        By: ' . $detspRec->author . '
                                    </li>
                                    <li class="ltn__blog-date">
                                        <i class="far fa-calendar-alt"></i>' . date('F d, Y', strtotime($detspRec->news_date)) . '
                                    </li>
                                </ul>
                            </div>
                            <p>' . $detspRec->content . '</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <aside class="sidebar-area blog-sidebar ltn__right-sidebar">
                        <!-- Popular Post Widget -->
                        <div class="widget ltn__popular-post-widget">
                            <h4 class="ltn__widget-title ltn__widget-title-border">Related News</h4>
                            <ul>
        ';
        $otherNews = News::get_other_news($detspRec->id, 6);
        if (!empty($otherNews)) {
            foreach ($otherNews as $news) {
                $img = BASE_URL . 'template/web/img/blog/olive.jpg';
                $file_path = SITE_ROOT . 'images/news/' . $news->image;
                if (file_exists($file_path) and !empty($news->image)) {
                    $img = IMAGE_PATH . 'news/' . $news->image;
                }
                $renewsdetail .= '
                                <li>
                                    <div class="popular-post-widget-item clearfix">
                                        <div class="popular-post-widget-brief">
                                            <h6><a href="' . BASE_URL . 'news/' . $news->slug . '">' . $news->title . '</a></h6>
                                            <div class="ltn__blog-meta">
                                                <ul>
                                                    <li class="ltn__blog-date">
                                                        <a href="' . BASE_URL . 'news/' . $news->slug . '"><i class="far fa-calendar-alt"></i>' . date("F d, Y", strtotime($news->news_date)) . '</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                ';
            }
        }
        $renewsdetail .= '
                            </ul>
                        </div>
                    </aside>
                </div>
            </div>
        ';

    }
}

$jVars['module:news-detail'] = $renewsdetail;
$jVars['module:news:bread'] = $newsbread;


?>