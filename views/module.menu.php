<?php
$result = $translation = '';

$menuRec = Menu::getMenuByParent(0, 1);

$current_url = $_SERVER["REQUEST_URI"];
$data = explode('/', $current_url);

if ($menuRec):
    $result .= '<ul>';
    foreach ($menuRec as $menuRow):
        $tot = strlen(SITE_FOLDER) + 2;
        $data = substr($_SERVER['REQUEST_URI'], $tot);
        $subclass1 = $subclass = '';

        if (!empty($data)):
            $subclass = ($menuRow->linksrc == $data) ? ' active ' : '';
            $parentInfo = Menu::find_by_linksrc($data);
            if ($parentInfo):
                $subclass1 = ($menuRow->id == $parentInfo->parentOf) ? ' active ' : '';
            endif;
        endif;

        $menusubRec = Menu::getMenuByParent($menuRow->id, 1);
        $chkchild = !empty($menusubRec) ? '1' : '';
        $pliClass = !empty($menusubRec) ? 'menu-icon' : '';

        $c_url = pathinfo($_SERVER["PHP_SELF"]);
        $chk = $c_url['filename'];

        if (!empty($subclass)) {
            $liclass = $subclass;
        } elseif (!empty($subclass1)) {
            $liclass = $subclass1;
        } else {
            $liclass = '';
        }
        if (($chk == 'index') and ($menuRow->linksrc == 'home')) {
            $liclass = ' active ';
        }

        $result .= '<li class="' . $pliClass . '">';
        $result .= getMenuList($menuRow->name, $menuRow->linksrc, $menuRow->linktype, $subclass . $subclass1, $chkchild);
        /* Second Level Menu */
        if ($menusubRec):
            $result .= '<ul>';
            foreach ($menusubRec as $menusubRow):
                $menusub2Rec = Menu::getMenuByParent($menusubRow->id, 1);
                $chkparent2 = (!empty($menusub2Rec)) ? 1 : 0;
                $result .= '<li>';
                $result .= getMenuList($menusubRow->name, $menusubRow->linksrc, $menusubRow->linktype, '', $chkparent2);
                $result .= '</li>';
            endforeach;
            $result .= '</ul>';
        endif;
        $result .= '</li>';
    endforeach;
    $result .= '<li class="menu-icon"><a href="#">SKIN CARE</a>
                    <ul class="mega-menu">
                        <li class="first-mega"><a href="#">Skin Care</a>
                            <ul>
                                <li>Skin care or skincare is a range of practices that support skin integrity, enhance its appearance, and relieve skin conditions.
                                    <br/><br/><span class="pt-80" style="font-weight:600;"><a href="#">Read More</a></span>
                                </li>
                            </ul>
                            <ul class="note-link">
                                <li><a href="https://sulavhealth.com/dhome">https://sulavhealth.com/dhome</a></li>
                                <li><a href="https://sulavhealth.com/dhome">https://sulavhealth.com/dhome</a></li>
                                <li><a href="https://sulavhealth.com/dhome">https://sulavhealth.com/dhome</a></li>
                                <li><a href="https://sulavhealth.com/dhome">https://sulavhealth.com/dhome</a></li>
                                <li><a href="https://sulavhealth.com/dhome">https://sulavhealth.com/dhome</a></li>
                                <li><a href="https://sulavhealth.com/dhome">https://sulavhealth.com/dhome</a></li>
                            </ul>
                        </li>
                        <li class="second-mega">
                            <div class="row">
                                <div class="col-xl-3 col-sm-6 col-6">
                                    <div class="ltn__product-item ltn__product-item-3 text-center">
                                        <div class="product-img product_hove" data-href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml">
                                            <a class="product-image-link" href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml"><img src="http://localhost/sulavhealth/images/product/galleryimages/DzfhP-5f9fa8692126980001f8b881_mamaearth-tea-tree-shampoo-for-dandruff-free-hai.jpeg" alt="Mamaearth Tea Tree Shampoo 250ml"></a>
                                        </div>
                                        <div class="product-info">
                                            <h4 class="product-title brand-name"><a href="http://localhost/sulavhealth/search/mama-earth" class="product-link">Mama Earth</a></h4>
                                            <a href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml" class="product-link">Mamaearth Tea Tree Shampoo 250ml</a>
                                            <div class="product-price">
                                                <span>NPR 530</span><del>NPR 558.4</del>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-xl-3 col-sm-6 col-6">
                                    <div class="ltn__product-item ltn__product-item-3 text-center">
                                        <div class="product-img product_hove" data-href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml">
                                            <a class="product-image-link" href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml"><img src="http://localhost/sulavhealth/images/product/galleryimages/DzfhP-5f9fa8692126980001f8b881_mamaearth-tea-tree-shampoo-for-dandruff-free-hai.jpeg" alt="Mamaearth Tea Tree Shampoo 250ml"></a>
                                        </div>
                                        <div class="product-info">
                                            <h4 class="product-title brand-name"><a href="http://localhost/sulavhealth/search/mama-earth" class="product-link">Mama Earth</a></h4>
                                            <a href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml" class="product-link">Mamaearth Tea Tree Shampoo 250ml</a>
                                            <div class="product-price">
                                                <span>NPR 530</span><del>NPR 558.4</del>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-3 col-sm-6 col-6">
                                    <div class="ltn__product-item ltn__product-item-3 text-center">
                                        <div class="product-img product_hove" data-href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml">
                                            <a class="product-image-link" href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml"><img src="http://localhost/sulavhealth/images/product/galleryimages/DzfhP-5f9fa8692126980001f8b881_mamaearth-tea-tree-shampoo-for-dandruff-free-hai.jpeg" alt="Mamaearth Tea Tree Shampoo 250ml"></a>
                                        </div>
                                        <div class="product-info">
                                            <h4 class="product-title brand-name"><a href="http://localhost/sulavhealth/search/mama-earth" class="product-link">Mama Earth</a></h4>
                                            <a href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml" class="product-link">Mamaearth Tea Tree Shampoo 250ml</a>
                                            <div class="product-price">
                                                <span>NPR 530</span><del>NPR 558.4</del>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-3 col-sm-6 col-6">
                                    <div class="ltn__product-item ltn__product-item-3 text-center">
                                        <div class="product-img product_hove" data-href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml">
                                            <a class="product-image-link" href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml"><img src="http://localhost/sulavhealth/images/product/galleryimages/DzfhP-5f9fa8692126980001f8b881_mamaearth-tea-tree-shampoo-for-dandruff-free-hai.jpeg" alt="Mamaearth Tea Tree Shampoo 250ml"></a>
                                        </div>
                                        <div class="product-info">
                                            <h4 class="product-title brand-name"><a href="http://localhost/sulavhealth/search/mama-earth" class="product-link">Mama Earth</a></h4>
                                            <a href="http://localhost/sulavhealth/product/product-detail/mamaearth-tea-tree-shampoo-250ml" class="product-link">Mamaearth Tea Tree Shampoo 250ml</a>
                                            <div class="product-price">
                                                <span>NPR 530</span><del>NPR 558.4</del>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li> 
                    </ul>
                </li></ul>';
endif;

if ($lang != 'gr') {
    $translation .= '
    <a href="javascript:;" class="nav-link language-change" data-lang="gr">
        <img src="' . BASE_URL . 'template/web/img/002-united-kingdom.png" alt="En to EL">
        English
    </a>
';
} else {
    $translation .= '
    <a href="javascript:;" class="nav-link language-change" data-lang="en">
        <img src="' . BASE_URL . 'template/web/img/greece.svg" alt="El to En">
        Greek
    </a>
';
}

$jVars['module:menu:main-menu'] = $result;
$jVars['module:menu:translation'] = $translation;


// Top Menu List
$topMenu = '';
$tMenus = Menu::getMenuByParent(0, 2);
if ($tMenus) {
    $topMenu .= '<ul>';
    foreach ($tMenus as $tMenu) {
        $topMenu .= '<li>';
        $topMenu .= getMenuList($tMenu->name, $tMenu->linksrc, $tMenu->linktype, '');
        $topMenu .= '</li>';
    }
    $topMenu .= '</ul>';
}
$jVars['module:menu:top-menu'] = $topMenu;


// Footer Menu List
$resfooter = '';
$FmenuRec = Menu::getMenuByParent(0, 3);
if ($FmenuRec):
    $resfooter .= '<ul>';
    foreach ($FmenuRec as $FmenuRow):
        $resfooter .= '<li>';
        $resfooter .= getMenuList($FmenuRow->name, $FmenuRow->linksrc, $FmenuRow->linktype, '');
        $resfooter .= '</li>';
    endforeach;
    $resfooter .= '</ul>';
endif;
$jVars['module:menu:footer-menu-1'] = $resfooter;

// Footer Menu List
$resfooter = '';
$FmenuRec = Menu::getMenuByParent(0, 4);
if ($FmenuRec):
    $resfooter .= '<ul>';
    foreach ($FmenuRec as $FmenuRow):
        $resfooter .= '<li>';
        $resfooter .= getMenuList($FmenuRow->name, $FmenuRow->linksrc, $FmenuRow->linktype, '');
        $resfooter .= '</li>';
    endforeach;
    $resfooter .= '</ul>';
endif;
$jVars['module:menu:footer-menu-2'] = $resfooter;

// Footer Menu List
$resfooter = '';
$FmenuRec = Menu::getMenuByParent(0, 5);
if ($FmenuRec):
    $resfooter .= '<ul>';
    foreach ($FmenuRec as $FmenuRow):
        $resfooter .= '<li>';
        $resfooter .= getMenuList($FmenuRow->name, $FmenuRow->linksrc, $FmenuRow->linktype, '');
        $resfooter .= '</li>';
    endforeach;
    $resfooter .= '</ul>';
endif;
$jVars['module:menu:footer-menu-3'] = $resfooter;
?>