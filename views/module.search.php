<?php
$category = $subcategory = $days = '';
if (isset($_REQUEST)) {
    foreach ($_REQUEST as $key => $val) {
        $$key = $val;
    }
}

$resisearch = $respkglist = $bread = $bread_title = $bread_text = $bread_text_extra = $navigation = '';
$home_gift_sets_modal = $home_gift_sets_script = $listofitems = '';
$serachtitle = 'List of Products';
$minprice = $maxprice = '';
if (defined('SEARCH_PAGE')) {
    // pr($_POST);
    if (isset($hotelslug) and !empty($hotelslug)) {
        redirect_to(BASE_URL . 'product/product-detail/' . $hotelslug);
    }

    /* search page search form start*/

    /* type filter start*/
    $type_filter = '';
    // $typeRec = SubProduct::get_type();
    $typeRec = array();
    $obj1 = new stdClass();
    $obj1->id = 1;
    $obj1->title = 'Product';
    $typeRec[] = $obj1;
    $obj2 = new stdClass();
    $obj2->id = 2;
    $obj2->title = 'Package';
    $typeRec[] = $obj2;

    foreach ($typeRec as $typeRow) {
        if (@$type_slug) {
            $sel = (@$type_slug == $typeRow->slug) ? 'checked' : '';
        } else {
            $sel = @in_array($typeRow->id, @$qtype) ? 'checked' : '';
        }
        $tot = SubProduct::get_total_type_product($typeRow->id);
        $type_filter .= '
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input qtype" name="qtype[]" ' . $sel . ' id="type-' . $typeRow->id . '" value="' . $typeRow->id . '">
                    <label class="custom-control-label d-flex justify-content-between" for="type-' . $typeRow->id . '">' . $typeRow->title . ' <span class="checkbox-count">' . $tot . '</span></label>
                </div>
        ';
    }
    /* type filter end*/

    /* category filter start*/
    $service_filter = '';
    if (@$service_slug) {
        $serviceRec = Services::get_services_by_slug($service_slug);
    } else {
        $serviceRec = Services::get_services();
    }
    foreach ($serviceRec as $serviceRow) {
        $disabled = $hidden = '';
        if (@$service_slug) {
            $sel = (@$service_slug == $serviceRow->slug) ? 'checked' : '';
            $disabled = 'disabled';
            $hidden = '<input type="hidden" name="qservice[]" value="' . $serviceRow->id . '"><input type="hidden" name="flag_service_check" value="' . $serviceRow->id . '">';
        } else {
            $sel = @in_array($serviceRow->id, @$qservice) ? 'checked' : '';
        }
        $tot = 0;
        $tot += SubProduct::get_total_service_product($serviceRow->id);
        if ($tot > 0) {
            $service_filter .= '
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input qservice" name="qservice[]" ' . $sel . ' id="serv-' . $serviceRow->id . '" value="' . $serviceRow->id . '" ' . $disabled . '>
                    ' . $hidden . '
                    <label class="custom-control-label d-flex justify-content-between" for="serv-' . $serviceRow->id . '">' . $serviceRow->title . ' <span class="checkbox-count">' . $tot . '</span></label>
                </div>
            ';
        }
    }

    /* category filter start*/
    $category_filter = '';
    if (@$service_slug) {
        $serviceRecord = Services::find_by_slug($service_slug);
        $categoryRec = category::get_category_by_service($serviceRecord->id);
    } else {
        $categoryRec = category::get_category();
    }
    foreach ($categoryRec as $categoryRow) {
        if (@$category_slug) {
            $sel = (@$category_slug == $categoryRow->slug) ? 'checked' : '';
        } else {
            $sel = @in_array($categoryRow->id, @$qcategory) ? 'checked' : '';
        }
        $tot = 0;
        if (@$service_slug) {
            $serviceRecord = Services::find_by_slug($service_slug);
            $tot += SubProduct::get_total_category_product_service($categoryRow->id, $serviceRecord->id);
        } else {
            $tot += SubProduct::get_total_category_product($categoryRow->id);
        }
        if ($tot > 0) {
            $category_filter .= '
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input qcategory" name="qcategory[]" ' . $sel . ' id="cat-' . $categoryRow->id . '" value="' . $categoryRow->id . '">
                    <label class="custom-control-label d-flex justify-content-between" for="cat-' . $categoryRow->id . '">' . $categoryRow->title . ' <span class="checkbox-count">' . $tot . '</span></label>
                </div>
            ';
        }
    }

    /* activites filter start*/
    $subcategory_filter = '';
    if (@$service_slug) {
        $serviceRecord = Services::find_by_slug($service_slug);
        $subcategoryRec = category::get_subcategory_by_service($serviceRecord->id);
    } else {
        $subcategoryRec = category::get_subcategory();
    }
    foreach ($subcategoryRec as $subcategoryRow) {
        if (@$subcategory_slug) {
            $sel = (@$subcategory_slug == $subcategoryRow->slug) ? 'checked' : '';
        } else {
            $sel = (@$qsubcategory[0] == $subcategoryRow->id) ? 'checked' : '';
        }
        $tot = 0;
        if (@$service_slug) {
            $serviceRecord = Services::find_by_slug($service_slug);
            $tot += SubProduct::get_total_subcategory_product_service($subcategoryRow->id, $serviceRecord->id);
        } else {
            $tot += SubProduct::get_total_subcategory_product($subcategoryRow->id);
        }
        if ($tot > 0) {
            $subcategory_filter .= '
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input qsubcategory" name="qsubcategory[]" ' . $sel . ' id="subcat-' . $subcategoryRow->id . '" value="' . $subcategoryRow->id . '">
                    <label class="custom-control-label d-flex justify-content-between" for="subcat-' . $subcategoryRow->id . '">' . $subcategoryRow->title . ' <span class="checkbox-count">' . $tot . '</span></label>
                </div>
            ';
        }
    }
    /* activites filter end*/

    /* brand filter start*/
    $brand_filter = '';
    if (@$service_slug) {
        $serviceRecord = Services::find_by_slug($service_slug);
        $brandRec = Brand::get_brand_service($serviceRecord->id);
    } else {
        $brandRec = Brand::get_brand();
    }
    foreach ($brandRec as $brandRow) {
        if (@$brand_slug) {
            $sel = (@$brand_slug == $brandRow->slug) ? 'checked' : '';
        } else {
            $sel = @in_array($brandRow->id, @$qbrand) ? 'checked' : '';
        }
        $tot = 0;
        if (@$service_slug) {
            $serviceRecord = Services::find_by_slug($service_slug);
            $tot += SubProduct::get_total_brand_product_service($brandRow->id,$serviceRecord->id);
        } else {
            $tot += SubProduct::get_total_brand_product($brandRow->id);
        }
        if ($tot > 0) {
            $brand_filter .= '
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input qbrand" name="qbrand[]" ' . $sel . ' id="bran-' . $brandRow->id . '" value="' . $brandRow->id . '">
                    <label class="custom-control-label d-flex justify-content-between" for="bran-' . $brandRow->id . '">' . $brandRow->title . ' <span class="checkbox-count">' . $tot . '</span></label>
                </div>
            ';
        }
    }

    /* Price Range start*/
    // $price_filter = '';
    // $priceRec = array('1000' => 'Below USD 1000', '2000' => 'USD 1000 - 2000', 'morethan2000' => 'USD 2000 above');
    // foreach ($priceRec as $k => $v) {
    //     $sel = ($k == @$gprice) ? 'checked' : '';
    //     $price_filter .= '
    //         <div class="custom-control custom-radio">
    //                         <input type="radio" class="custom-control-input gprice" name="gprice" ' . $sel . ' id="price-' . $k . '" value="' . $k . '">
    //                         <label class="custom-control-label d-flex justify-content-between" for="price-' . $k . '">' . $v . ' <span class="checkbox-count">(123)</span></label>
    //                     </div>
    //     ';
    // }
    /* Price Range end*/

    /* Duration start*/
    // $duration_filter = '';
    // $durationRec = array('5' => '1-5 Days', '10' => '6-10 Days', '15' => '11-15 Days', 'morethan15' => 'More than 15 Days');
    // foreach ($durationRec as $k => $v) {
    //     $sel = ($k == @$days) ? 'checked' : '';
    //     $tot = 0;
    //     switch ($k) {
    //         case '5':
    //             $sql = "SELECT id FROM tbl_package WHERE status=1 AND days <= 5 ";
    //             break;
    //         case '10':
    //             $sql = "SELECT id FROM tbl_package WHERE status=1 AND ( days > 5 AND days <= 10 ) ";
    //             break;
    //         case '15':
    //             $sql = "SELECT id FROM tbl_package WHERE status=1 AND ( days > 10 AND days <= 15 ) ";
    //             break;
    //         case 'morethan15':
    //             $sql = "SELECT id FROM tbl_package WHERE status=1 AND days >= 16 ";
    //             break;
    //     }
    //     $tot = $db->num_rows($db->query($sql));
    //     $duration_filter .= '
    //                 <div class="custom-control custom-radio">
    //                     <input type="radio" class="custom-control-input gdays" name="days" ' . $sel . ' id="days-' . $k . '" value="' . $k . '">
    //                     <label class="custom-control-label d-flex justify-content-between" for="days-' . $k . '">' . $v . ' <span class="checkbox-count">' . $tot . '</span></label>
    //                 </div>
    //     ';
    // }
    /* Duration end*/

    $resisearch .= '
        <div class="container mx-auto product-filter">
            <div class="row">
                <div class="product-filter-side col-md-2">
                    <h2>Filters</h2>
                    
                    <form action="' . BASE_URL . 'searchlist" method="post" id="search_form">
                        <!-- <div class="form-group">
                            <label>Type:</label><br>
                            ' . $type_filter . '
                        </div>  --> 
                        <div class="form-group">
                            <label>Services:</label><br>
                            ' . $service_filter . '
                        </div>             
                        <div class="form-group">
                            <label>Category:</label><br>
                            ' . $category_filter . '
                        </div>
                        <div class="form-group"> 
                            <label>Sub-category:</label><br>
                            <div class="subfilter">
                                ' . $subcategory_filter . '
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Brands:</label><br>
                            ' . $brand_filter . '
                        </div>
                        <div class="form-group">
                            <label for="price-range">Price Range:</label><br>
                            <div class="price-container">
                            <div id="price-slider" class="mt-20"></div>
                                <div class="price-input">
                                    <input type="text" id="price-start" readonly>
                                    <input type="text" id="price-end" readonly>
                                </div>
                            </div>
                        </div>
                    <!-- <button type="button" class="btn btn-primary">Apply Filter</button> -->
                    </form>
                </div>
    ';
    /* search page search form end*/

    global $db;
    // header search form
    if (!empty($searchkey)) {
        /*$sql = "SELECT prod.*
            FROM tbl_product_sub as prod  
            INNER JOIN tbl_services as serv ON prod.service_id = serv.id 
            INNER JOIN tbl_category as cat ON prod.Category = cat.id 
            WHERE prod.status=1 AND 
              ( prod.title LIKE '%" . $searchkey . "%' OR
                serv.title LIKE '%" . $searchkey . "%' OR
                cat.title LIKE '%" . $searchkey . "%' ) ";*/
        $sql = "SELECT prod.*
            FROM tbl_product_sub as prod  
            WHERE prod.status=1 AND 
              ( prod.title LIKE '%" . $searchkey . "%' ) ";
    } else {
        $sql = "SELECT * FROM tbl_product_sub as prod WHERE status=1 ";
    }

    /*$sql = "SELECT pkg.id, pkg.title, pkg.slug, pkg.breif, pkg.days, pkg.image, pkg.price, pkg.difficulty, pkg.accomodation,
            act.title as activity, act.slug as activity_slug, 
            dst.title as destination, dst.slug as destination_slug
            FROM tbl_package  pkg 
            INNER JOIN tbl_destination  dst 
            ON pkg.destinationId = dst.id 
            INNER JOIN tbl_activities act 
            ON pkg.activityId = act.id 
            WHERE pkg.status=1 ";*/

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
    // if (@$category_slug) {
    //     $cate = Destination::find_by_slug($category_slug);
    //     $sql .= " AND prod.Category = $cate->id ";
    // }
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
    if (@$service_slug) {
        $ser = Services::find_by_slug($service_slug);
        $serachtitle = $ser->title;
        $sql .= " AND prod.service_id = $ser->id ";
    }

    // pr($serachtitle);
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
        $bran = Brand::find_by_slug($brand_slug);
        if (!empty($bran)) {
            $serachtitle = $bran->title;
            $sql .= " AND prod.brand = $bran->id ";
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


    /* Breadcrumb Start*/
    // if (!empty($gdestination_slug)) {
    //     $destt = Destination::find_by_slug($gdestination_slug);
    //     $total = Package::get_total_destination_packages($destt->id);
    //     $imgs = unserialize($destt->gallery);
    //     if ($imgs != "a:0:{}") {
    //         $file_path = SITE_ROOT . 'images/destination/gallery/' . $imgs[0];
    //         if (file_exists($file_path)) {
    //             $bread .= '<style>.about-banner{background: linear-gradient(180deg, rgba(0, 0, 0, 0.22), rgba(0, 0, 0, 0.22)),url(' . IMAGE_PATH . 'destination/gallery/' . $imgs[0] . ') !important;}</style>';
    //         }
    //     }
    //     $bread .= '
    //             <nav aria-label="breadcrumb">
    //                 <ol class="breadcrumb">
    //                     <!--<li class="breadcrumb-item"><a href="' . BASE_URL . 'home"><i class="fas fa-home"></i></a></li>
    //                     <li class="breadcrumb-item one"><a href="' . BASE_URL . 'destination-list">Destination</a></li>-->
    //                     <li class="breadcrumb-item two active" aria-current="page">' . $destt->title . '</li>
    //                 </ol>
    //             </nav>

    //             <!--<h4 class="mt-0 line-125 title-breadcrum">' . $total . ' Trip Packages in ' . $destt->title . '</h4>-->
    //     ';
    //     if ($destt->id == 11) {
    //         $bread_title .= '
    //             <h2><span><span style="color:#3a3838">Packages for ' . $destt->title . '</span></span></h2>
    //         ';
    //     } else {
    //         $bread_title .= '
    //             <h2><span><span style="color:#3a3838">Tour Packages in ' . $destt->title . '</span></span></h2>
    //         ';
    //     }
    //     $brief = explode('<hr id="system_readmore" style="border-style: dashed; border-color: orange;" />', $destt->content);
    //     $bread_text .= '
    //             <h2>' . $destt->title . '</h2>';
    //     if (!empty($brief[0])) {
    //         $bread_text .= '
    //             <p>' . strip_tags($brief[0]) . '
    //                 <a href="#" id="read_more">Read More</a>
    //             </p>
    //         ';
    //     }
    //     if (!empty($brief[1])) {
    //         $bread_text_extra .= '
    //             <h4>' . $destt->title . '</h4>
    //                 ' . $brief[1] . '
    //         ';
    //     }
    // }
    // if (!empty($qdestination[0])) {
    //     if ($qdestination[0] == 'all') {
    //         $total = Package::get_total_destination_packages(10);
    //         $bread .= '
    //             <nav aria-label="breadcrumb">
    //                 <ol class="breadcrumb">
    //                     <li class="breadcrumb-item"><a href="' . BASE_URL . 'home"><i class="fas fa-home"></i></a></li>
    //                     <li class="breadcrumb-item one"><a href="' . BASE_URL . 'destination-list">Destination</a></li>
    //                     <li class="breadcrumb-item two active" aria-current="page">All</li>
    //                 </ol>
    //             </nav>
    //             <!--<h4 class="mt-0 line-125 title-breadcrum">' . $total . ' Trip Packages in Nepal</h4>-->
    //     ';
    //     } else {
    //         $destt = Destination::find_by_id($qdestination[0]);
    //         $total = Package::get_total_destination_packages($destt->id);
    //         $imgs = unserialize($destt->gallery);
    //         if ($imgs != "a:0:{}") {
    //             $file_path = SITE_ROOT . 'images/destination/gallery/' . $imgs[0];
    //             if (file_exists($file_path)) {
    //                 $bread .= '<style>.about-banner{background: linear-gradient(180deg, rgba(0, 0, 0, 0.22), rgba(0, 0, 0, 0.22)),url(' . IMAGE_PATH . 'destination/gallery/' . $imgs[0] . ') !important;}</style>';
    //             }
    //         }
    //         $bread .= '
    //             <nav aria-label="breadcrumb">
    //                 <ol class="breadcrumb">
    //                     <li class="breadcrumb-item"><a href="' . BASE_URL . 'home"><i class="fas fa-home"></i></a></li>
    //                     <li class="breadcrumb-item one"><a href="' . BASE_URL . 'destination-list">Destination</a></li>
    //                     <li class="breadcrumb-item two active" aria-current="page">' . $destt->title . '</li>
    //                 </ol>
    //             </nav>
    //             <!--<h4 class="mt-0 line-125 title-breadcrum">' . $total . ' Trip Packages in ' . $destt->title . '</h4>-->
    //         ';
    //         if ($qdestination[0] == 11) {
    //             $bread_title .= '
    //             <h2><span><span style="color:#3a3838">Packages for ' . $destt->title . '</span></span></h2>
    //             ';
    //         } else {
    //             $bread_title .= '
    //             <h2><span><span style="color:#3a3838">Tour Packages in ' . $destt->title . '</span></span></h2>
    //             ';
    //         }
    //         $brief = explode('<hr id="system_readmore" style="border-style: dashed; border-color: orange;" />', $destt->content);
    //         $bread_text .= '
    //             <h2>' . $destt->title . '</h2>';
    //         if (!empty($brief[0])) {
    //             $bread_text .= '
    //             <p>' . strip_tags($brief[0]) . '
    //                 <a href="#" id="read_more">Read More</a>
    //             </p>
    //             ';
    //         }
    //         if (!empty($brief[1])) {
    //             $bread_text_extra .= '
    //             <h4>' . $destt->title . '</h4>
    //                 ' . $brief[1] . '
    //             ';
    //         }
    //     }
    // }
    // if (!empty($gactivity_slug)) {
    //     $totalIds = Activities::get_id_by_slug($gactivity_slug);
    //     $tot = 0;
    //     foreach ($totalIds as $totalId) {
    //         $tot += Package::get_total_activities_packages($totalId->id);
    //     }
    //     $actt = Activities::find_by_slug($gactivity_slug);
    //     $destt = Destination::find_by_id($actt->destinationId);
    //     if (!empty($actt->banner_image)) {
    //         $file_path = SITE_ROOT . 'images/activities/banner/' . $actt->banner_image;
    //         if (file_exists($file_path)) {
    //             $bread .= '<style>.about-banner{background: linear-gradient(180deg, rgba(0, 0, 0, 0.22), rgba(0, 0, 0, 0.22)),url(' . IMAGE_PATH . 'activities/banner/' . $actt->banner_image . ') !important;}</style>';
    //         }
    //     }
    //     $bread .= '
    //             <nav aria-label="breadcrumb">
    //                 <ol class="breadcrumb">
    //                     <!--<li class="breadcrumb-item"><a href="' . BASE_URL . 'home"><i class="fas fa-home"></i></a></li>
    //                     <li class="breadcrumb-item one"><a href="' . BASE_URL . 'activity-list/' . $destt->slug . '">Activity</a></li>-->
    //                     <li class="breadcrumb-item two active" aria-current="page">' . $actt->title . '</li>
    //                 </ol>
    //             </nav>
    //             <!--<h4 class="mt-0 line-125 title-breadcrum">' . $tot . ' Trip Packages in ' . $actt->title . '</h4>-->
    //     ';
    //     $bread_title .= '
    //         <h2><span><span style="color:#3a3838">' . $actt->title . ' Packages</span></span></h2>
    //     ';
    //     $brief = explode('<hr id="system_readmore" style="border-style: dashed; border-color: orange;" />', $actt->content);
    //     $bread_text .= '
    //             <h2>' . $actt->title . '</h2>';
    //     if (!empty($brief[0])) {
    //         $bread_text .= '
    //             <p>' . strip_tags($brief[0]) . '
    //                 <a href="#" id="read_more">Read More</a>
    //             </p>
    //         ';
    //     }
    //     if (!empty($brief[0])) {
    //         $bread_text_extra .= '
    //             <h4>' . $actt->title . '</h4>
    //                 ' . $brief[1] . '
    //         ';
    //     }

    // }
    /* Breadcrumb End*/
    $tags = '';
    $page = (isset($_REQUEST["pageno"]) and !empty($_REQUEST["pageno"])) ? $_REQUEST["pageno"] : 1;
    $limit = 10000;
    $total_num = $db->num_rows($db->query($sql));
    $startpoint = ($page * $limit) - $limit;
    $start = $startpoint + 1;
    $end = (($startpoint + $limit) > $total_num) ? $total_num : $startpoint + $limit;
    $sql .= " ORDER BY sortorder ASC";
    // $sql .= " ORDER BY prod.sortorder ASC";
    $sql .= " LIMIT " . $startpoint . "," . $limit;

    $res = $db->query($sql);
    $total = $db->affected_rows($res);
    $listofitems .= '
    
    <label id="totalitems">(' . $total . ' items found)</label>';
    if ($total > 0) {
        $i = 1;
        while ($rows = $db->fetch_array($res)) {
            // if (file_exists(SITE_ROOT . 'images/package/' . $rows['image'])) {
            // $sql = "SELECT AVG(rating) 'rating' FROM tbl_review WHERE package_id=" . $rows['id'];
            // $ratingObj = $db->fetch_object($db->query($sql));
            // $rating_float = (float)$ratingObj->rating;
            // $rating_floor = floor($rating_float);
            // $rating = ($rating_float <= ($rating_floor + 0.5)) ? ($rating_floor + 0.5) : (ceil($rating_float));
            // $days = ($rows['days'] == 1) ? 'day' : 'days';

            $price_text = '';
            if (!empty($rows['price1']) and (empty($rows['offer_price']))) {
                $price_text = '<span>' . $rows['currency'] . ' ' . $rows['price1'] . '</span>';
            }
            if (!empty($rows['discount1'])) {
                $price_text = '<span>' . $rows['currency'] . ' ' . $rows['discount1'] . '</span><del>' . $rows['currency'] . ' ' . $rows['price1'] . '</del>';
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
            $prodbrand = Brand::find_by_id($rows['brand']);
            $prodservice = Services::find_by_id($rows['service_id']);
            if (!empty($prodbrand)) {
                $titlebrand = $prodbrand->title;
                $slug = $prodbrand->slug;
            } else {
                $titlebrand = '';
                $slug = '';
            }
            if (!empty($prodservice)) {
                $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $rows['slug'] . '';
            } else {
                $slugs = '' . BASE_URL . 'product/product-detail/' . $rows['slug'] . '';;
            }
            // pr($prodbrand);
            // for top part (opening)
            if ($i % 3 == 1) {
                $respkglist .= '
                    <div class="lazy"><!--
                ';
            }
            $respkglist .= '
                <div class="col-xl-3 col-sm-6 col-6">
                    <div class="ltn__product-item ltn__product-item-3 text-center">
                        <a href="' . $slugs . '"><div class="product-img product_hove" data-href="' . $slugs . '">
                            <img src="' . $img . '" alt="' . $rows['title'] . '">
                        </div></a>
                        <div class="product-info">
                            <h4 class="product-title"><a href="' . BASE_URL . 'search/' . $slug . '" class="product-link">' . $titlebrand . '</a></h4>
                            <a href="' . $slugs . '" class="product-link">' . $rows['title'] . '</a>
                            <div class="product-price">
                                ' . $price_text . '
                            </div>
                            <div class="product-action">
            ';
            if (!empty($rows['tag'])) {
                $respkglist .= '<li class="sale-badge">' . $rows['tag'] . '</li>';
            }
            $respkglist .= '
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
                </div>
            ';
            // for bottom part (closing)
            if ($i % 3 == 0 or $i == $total) {
                $respkglist .= ' 
                    --></div>
                ';
            }
            $i++;
            $home_gift_sets_script .= '
                <script class="productscrip">
                    $("#quick_view_modal_product_' . $rows['slug'] . '").on("shown.bs.modal", function () {
                      $(".ltn__blog-slider-one-active1").slick("setPosition");
                    })
                </script>
            ';
            $home_gift_sets_modal .= '
                <div class="ltn__modal-area ltn__quick-view-modal-area " id="productpopup">
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
                                                    <h4 class="product-title"><a href="' . BASE_URL . 'search/' . $slug . '" class="product-link">' . $titlebrand . '</a></h4>
                                                    <h3>' . (($lang == "gr") ? $rows['title_greek'] : $rows['title']) . '</h3>
                                                        ' . (($lang == "gr") ? $rows['brief_greek'] : $rows['brief']) . '
                                                        <br/>
                                                        <br/>

                                                        <a href="' . $slugs . '" class="" style="font-size: 0.85em; text-decoration: underline; text-transform: capitalize; color: #0E75BA ;">
                                                            <span>' . SHOP_VIEW_MORE . '</span>
                                                        </a>

                
                     <div class="shoping-cart-table table-responsive">
                    <form id="add-cart-product-' . $rows['slug'] . '">
                    <table class="table">
                        <tbody>
                        
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
            ';
            if (!empty($giftSet->qnt1)) {
                $home_gift_sets_modal .= '<input class="form-check-input" type="checkbox" name="product_check[]" value="1">';
            } else {
                $home_gift_sets_modal .= '<input class="form-check-input" type="hidden" name="product_check[]" checked value="1">';
            }
            $prodPrice = (!empty($rows['discount1']) and $rows['discount1'] > 0) ? $rows['discount1'] : $rows['price1'];
            $home_gift_sets_modal .= '
                                        <input type="hidden" name="product_qnt_1" value="' . $rows['qnt1'] . '">
                                        <input type="hidden" name="product_net_qnt_1" value="' . $rows['netqnt1'] . '">
                                        <label class="form-check-label">' . $rows['netqnt1'] . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_1" value="' . $prodPrice . '">
                                    ' . $rows['currency'] . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
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
                            
            ';

            if (!empty($rows['qnt2'])) {
                $prodPrice = (!empty($rows['discount2']) and $rows['discount2'] > 0) ? $rows['discount2'] : $rows['price2'];
                $home_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="2">
                                        <input type="hidden" name="product_qnt_2" value="' . $rows['price2'] . '">
                                        <input type="hidden" name="product_net_qnt_2" value="' . $rows['netqnt2'] . '">
                                        <label class="form-check-label">' . $rows['netqnt2'] . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_2" value="' . $prodPrice . '">
                                    ' . $rows['currency'] . ' ' . sprintf("%.2f", $prodPrice) . '
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
                                    <h6 class="product-sub-total">' . $rows['currency'] . ' 0.00</h6>
                                </td>
                            </tr>
                ';
            }

            if (!empty($rows['qnt3'])) {
                $prodPrice = (!empty($rows['discount3']) and $rows['discount3'] > 0) ? $rows['discount3'] : $rows['price3'];
                $home_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="3">
                                        <input type="hidden" name="product_qnt_3" value="' . $rows['qnt3'] . '">
                                        <input type="hidden" name="product_net_qnt_3" value="' . $rows['netqnt3'] . '">
                                        <label class="form-check-label">' . $rows['netqnt3'] . '</label>
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
                $prodPrice = (!empty($rows['discount4']) and $rows['discount4'] > 0) ? $rows['discount4'] : $rows['price4'];
                $home_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="4">
                                        <input type="hidden" name="product_qnt_4" value="' . $rows['qnt4'] . '">
                                        <input type="hidden" name="product_net_qnt_4" value="' . $rows['netqnt4'] . '">
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
                                                    <li style="padding-right: 16.28rem;">
                                                    <a href="#" class="add-wishlist theme-btn-2 btn btn-effect-2" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $rows['slug'] . '">
                                                        <i class="far fa-heart"></i>
                                                       <!-- <span>' . SHOP_ADD_TO_WISHLIST . '</span> -->
                                                    </a>
                                                </li>
                                                    
                                                        <li>
                                                            <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="' . SHOP_ADD_TO_CART . '" data-cartid="' . $rows['slug'] . '" form-id="add-cart-product-' . $rows['slug'] . '">
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

            // }
        }
        // $navigation .= '
        //             <div class="pager-innner">
        //                 <div class="row align-items-center text-center text-lg-left">
        //                     <div class="col-12 col-lg-5">
        //                         Showing result ' . $start . ' to ' . $end . ' from ' . $total_num . '
        //                     </div>
        //                     <div class="col-12 col-lg-7">';
        // $navigation .= get_front_pagination_for_search($total_num, $limit, $page, BASE_URL . 'search');
        // $navigation .= '
        //                     </div>
        //                 </div>
        //             </div>
        // ';
    } else {
        $respkglist .= '
            <figure class="tour-long-item-01">
                <h3>No Result Found</h3>
             </figure>';
    }
    /*}else{
        $url = BASE_URL.'pages / errors';
        redirect_to($url);
    }*/

    $maxs = SubProduct::get_max_price();
    foreach ($maxs as $max) {
        $maxprice = $max->discount1;
    }

    $mins = SubProduct::get_min_price();
    foreach ($mins as $min) {
        if ($min->discount1 == 0) {
            $minprice = $min->price1;
        } else {
            $minprice = $min->discount1;
        }
    }
    //   pr($min);

}

$jVars['module:search-searchform'] = $resisearch;
$jVars['module:search-totalitems'] = $listofitems;
$jVars['module:search-maxprice'] = $maxprice;
$jVars['module:search-minprice'] = $minprice;
$jVars['module:modal-popup-search'] = $home_gift_sets_modal;
$jVars['module:modal-popup-script'] = $home_gift_sets_script;
$jVars['module:package-search-breadcrumb'] = $bread;
$jVars['module:package-search-breadcrumb-title'] = $bread_title;
$jVars['module:package-search-breadcrumb-text'] = $bread_text;
$jVars['module:package-search-breadcrumb-extra'] = $bread_text_extra;
$jVars['module:package-searchlist'] = $respkglist;
$jVars['module:package-searchtitle'] = $serachtitle;

$jVars['module:package-navigation'] = $navigation;
?>