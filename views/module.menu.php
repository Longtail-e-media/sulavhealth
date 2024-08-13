<?php
$result = $resultarticle = $translation = '';

$menuRec = Menu::getMenuByParent(0, 1);

$current_url = $_SERVER["REQUEST_URI"];
$data = explode('/', $current_url);

if ($menuRec):
    $result .= '<ul>';
    // pr($menuRec);
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
        if($menuRow->menutype==0){
        $result .= '<li class="' . $pliClass . '">';
        $result .= getMenuList($menuRow->name, $menuRow->linksrc, $menuRow->linktype, $subclass . $subclass1, $chkchild);
        
        /* Second Level Menu */
        if ($menusubRec):
            $result .= '<ul>';
            foreach ($menusubRec as $menusubRow):
                // pr($menuRec);
                // if($menuRow->menutype==0){
                    // pr($menuRow);
                    $menusub2Rec = Menu::getMenuByParent($menusubRow->id, 1);
                    // pr($menusub2Rec);
                    $chkparent2 = (!empty($menusub2Rec)) ? 1 : 0;
                    $result .= '<li>';
                    $result .= getMenuList($menusubRow->name, $menusubRow->linksrc, $menusubRow->linktype, '', $chkparent2);
                    $result .= '</li>';
                // }
                // elseif($menuRow->menutype==1){
                // pr($resultarticle);

              
                
            // }
            endforeach;
            $result .= '</ul>';
        endif;
        $result .= '</li>';
    }
    else{
    $menuarticles = Article::menuArticle($menuRow->category, $menuRow->Subcategory, $menuRow->service_id);
    // pr($db->last_query);
    // pr($menuarticles);
    $firstarticles= array_shift($menuarticles);
    // pr($firstarticles);
    $result .= '<li class="menu-icon"><a href="#">'.$menuRow->name.'</a>
                <ul class="mega-menu">';
    if(!empty($firstarticles)):
        $result .= '<li class="first-mega"><a href="#">'.$firstarticles->title.'</a>
                <ul>
                    <li>'.$firstarticles->content.'
                        <br/><br/><span class="pt-80" style="font-weight:600;"><a href="'. BASE_URL.$firstarticles->slug.'">Read More</a></span>
                    </li>
                </ul>';
             $result .= '   <ul class="note-link">';
             
             foreach($menuarticles as $menuarticle):
             $result .= '
                    <li><a href="'.BASE_URL.''.$menuarticle->slug.'">'.$menuarticle->title.'</a></li>
               ';
            endforeach;
               
                    $result .= ' </ul>
            </li>';
    endif;

        $menusubRec = Menu::getMenuByParent($menuRow->id, 1);
        if ($menusubRec):
            $result .= '';
            foreach ($menusubRec as $menusubRow):
                // pr($menuRec);
                // if($menuRow->menutype==0){
                    // pr($menuRow);
                    $menusub2Rec = Menu::getMenuByParent($menusubRow->id, 1);
                    // pr($menusub2Rec);
                    $chkparent2 = (!empty($menusub2Rec)) ? 1 : 0;
                    $result .= '<li>';
                    $result .= getMenuList($menusubRow->name, $menusubRow->linksrc, $menusubRow->linktype, '', $chkparent2);
                    $menusubsubRec = Menu::getMenuByParent($menusubRow->id, 1);
                    $result .= '<ul>';
                    foreach ($menusubsubRec as $menusubsubRow):
                        $menusub3Rec = Menu::getMenuByParent($menusubsubRow->id, 1);
                    // pr($menusub2Rec);
                    $chkparent3 = (!empty($menusub3Rec)) ? 1 : 0;
                    $result .= '<li>';
                    $result .= getMenuList($menusubsubRow->name, $menusubsubRow->linksrc, $menusubsubRow->linktype, '', $chkparent3);
                    $result .= '</li>';
                    endforeach;
                    $result .= '</ul>';
                    // $menusub3Rec = Menu::getMenuByParent($menusubRow->id, 1);

                    $result .= '</ul>';
                // }
                // elseif($menuRow->menutype==1){
                // pr($resultarticle);

              
                
            // }
            endforeach;
            $result .= '';
        endif;
        $result .= ' 
                
                </li>';
        // pr($resultarticle);
    }
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
                        <li><a href="#">Derma Products</a>
                            <ul>
                                <li><a href="#">Shadow Gel SPF 50+</a></li>
                                <li><a href="#">ACNEMOIST MOISTURIZING CREAM 60gm</a></li>
                                <li><a href="#">ACNEMOIST MOISTURIZING CREAM 60gm</a></li>
                                <li><a href="#">ACNEMOIST MOISTURIZING CREAM 60gm</a></li>
                                <li><a href="#">ACNEMOIST MOISTURIZING CREAM 60gm</a></li>
                                <li><a href="#">Strallium Stretch Mark Cream</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Eye Products</a>
                            <ul>
                                <li><a href="#">Shadow Gel SPF 50+</a></li>
                                <li><a href="#">ACNEMOIST MOISTURIZING CREAM 60gm</a></li>
                                <li><a href="#">ACNEMOIST MOISTURIZING CREAM 60gm</a></li>
                                <li><a href="#">ACNEMOIST MOISTURIZING CREAM 60gm</a></li>
                                <li><a href="#">ACNEMOIST MOISTURIZING CREAM 60gm</a></li>
                                <li><a href="#">Strallium Stretch Mark Cream</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Hygiene Products</a>
                            <ul>
                                <li><a href="#">Strallium Stretch Mark Cream</a></li>
                                <li><a href="#">Strallium Stretch Mark Cream</a></li>
                                <li><a href="#">Strallium Stretch Mark Cream</a></li>
                                <li><a href="#">Strallium Stretch Mark Cream</a></li>
                                <li><a href="#">Strallium Stretch Mark Cream</a></li>
                                <li><a href="#">Strallium Stretch Mark Cream</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                </ul>';
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