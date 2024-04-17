<?php

$lang = !empty($session->get('lang_type')) ? $session->get('lang_type') : 'r';

// SITE REGULARS
$jVars['site:header'] 		    = Config::getField('headers',true);
$jVars['site:footer'] 		    = Config::getField('footer',true);
$jVars['site:SITE_FOLDER'] 		= SITE_FOLDER;
$jVars['site:BASE_URL'] 		= BASE_URL;
$jVars['site:language-class']   = ($lang == "gr") ? "greek-lang" : "";

$siteRegulars 				    = Config::find_by_id(1);
$jVars['site:copyright']	    = '<p> '.str_replace('{year}',date('Y'),$siteRegulars->copyright).' Website by <a href="https://longtail.info/" target="_blank"><span class="highlight"> Longtail e-media</span></a> </p>';


$jVars['site:fevicon']		    =  '<link rel="shortcut icon" href="'.IMAGE_PATH.'preference/'.$siteRegulars->icon_upload.'"> 
<link rel="apple-touch-icon" href="'.IMAGE_PATH.'preference/'.$siteRegulars->icon_upload.'"> 
<link rel="apple-touch-icon" sizes="72x72" href="'.IMAGE_PATH.'preference/'.$siteRegulars->icon_upload.'"> 
<link rel="apple-touch-icon" sizes="114x114" href="'.IMAGE_PATH.'preference/'.$siteRegulars->icon_upload.'">';

$jVars['site:logo']	            = '<a href="'.BASE_URL.'home" class="navbar-brand"><img src="'.IMAGE_PATH.'preference/'.$siteRegulars->logo_upload.'" alt="'.$siteRegulars->sitetitle.'"></a>';

$jVars['site:seotitle']         = MetaTagsFor_SEO();

$jVars['site:googleanalatic']   = $siteRegulars->google_anlytics;

$jVars['site:webAccessibility'] = '
    <div class="footer-e-banner">
        <a href="' . BASE_URL . 'template/web/img/espa_document_a.pdf" target=_blank"><img src="' . IMAGE_PATH . 'e-bannerespaEΤΠΑ.jpg" alt="e-bannerespaEΤΠΑ" height="40px" width="250px"></a>
    </div>
    
    <a href="#" class="cart-icon-header webAccessBtn" data-toggle="modal" data-target="#side-webAccessibility" type="button">
        <img src="' . BASE_URL . 'css/front/img/accessibility/webaccessibility.png" alt="Accessibility">
    </a>
    
    <div class="modal modal-redesign" id="side-webAccessibility" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="false">
        <div class="modal-dialog modal-dialog-custom-chart accessibility" role="document">
            <div class="modal-content right-modal modal-webAccessibility">
                <div class="modal-header">
                    <div class="header-container-modal-custom modal-webAccessibility-background">
                        <div class="hidden text-title-header-modal-webAcc fs-22 pr-20">Web Accessibility</div>
                        <img src="' . BASE_URL . 'template/web/img/accessibility/close.png" width="20px" class="closeWebAcc closeImg pointer" alt="Close" data-dismiss="modal" aria-label="Close"/>
                    </div>
                </div>
                <div class="modal-body container-inside-modal-custom modal-webAccessibility-background">
                    <div class="pt-10 text-center fs-16 mt-10">
                        <div class="btn-group-vertical">
                            <div class="btn btn-default" onclick="dataLayer.push({\'event\': \'increaseFont\'});">
                                <img class="increaseFont2 width-30 left-img pad-5 pointer" src="' . BASE_URL . 'template/web/img/accessibility/letterZoom.png" alt="Increase Font">
                            </div>
                            <div class="btn btn-default" onclick="dataLayer.push({\'event\': \'decreaseFont\'});">
                                <img class="decreaseFont2 width-30 right-img pad-5 pointer" src="' . BASE_URL . 'template/web/img/accessibility/letterMinus.png" alt="Decrease font">
                            </div>
                        </div>
                    </div>
                    <div class="pt-10 text-center fs-16">
                        <div class=" btn-group-vertical">
                            <div class="increaseContrast  btn btn-default" onclick="dataLayer.push({\'event\': \'increaseContrast\'});">
                                <img class="left-img width-30" src="' . BASE_URL . 'template/web/img/accessibility/brightnessRev.png" alt="brighness">
                            </div>
                            <div class="resetContrast btn btn-default fs-15">
                                <img class="left-img width-30" src="' . BASE_URL . 'template/web/img/accessibility/neutral.png" alt="Neutral">
                            </div>
                            <div class="decreaseContrast btn btn-default" onclick="dataLayer.push({\'event\': \'decreaseContrast\'});">
                                <img class="right-img width-30" src="' . BASE_URL . 'template/web/img/accessibility/brightness.png" alt="Decrease brightness">
                            </div>
                        </div>
                    </div>
                    <div class="btnRevertClick pt-10 text-center fs-16">
                        <div class="resetContrast btn btn-default" onclick="dataLayer.push({\'event\': \'revertColor\'});">
                            <img class="right-img width-30" src="' . BASE_URL . 'template/web/img/accessibility/contrast-button.png" alt="Contrast">
                        </div>
                    </div>
                    <div class="pt-10 text-center fs-16">
                        <div class="row">
                            <div class="btn-group-vertical" role="group">
                                <div class="btn btn-default">
                                    <img class="revert-img defaultBtn  width-30 pointer" src="' . BASE_URL . 'template/web/img/accessibility/defaultWebAcc.png"
                                         onclick="dataLayer.push({\'event\': \'changeBackground1\'});" alt="Reset Background color">
                                </div>
                                <div class="btn btn-default">
                                    <img class="revert-img blackWhiteBtn  width-30 pointer" src="' . BASE_URL . 'template/web/img/accessibility/blackWhiteWebAcc.png"
                                         onclick="dataLayer.push({\'event\': \'changeBackground2\'});" alt="Change background color to black">
                                </div>
                                <div class="btn btn-default">
                                    <img class="revert-img greyBlackBtn  width-30 pointer" src="' . BASE_URL . 'template/web/img/accessibility/greyBlackWebAcc.png"
                                         onclick="dataLayer.push({\'event\': \'changeBackground3\'});" alt="Change the background color to gray">
                                </div>
    
                                <div class="btn btn-default">
                                    <img class="revert-img yellowBlackBtn width-30 pointer" src="' . BASE_URL . 'template/web/img/accessibility/yellowBlackWebAcc.png"
                                         onclick="dataLayer.push({\'event\': \'changeBackground4\'});" alt="Change background color to yellow">
                                </div>
                                <div class="btn btn-default">
                                    <img class="revert-img blackYellowBtn width-30 pointer" src="' . BASE_URL . 'template/web/img/accessibility/blackYellowWebAcc.png"
                                         onclick="dataLayer.push({\'event\': \'changeBackground5\'});" alt="Change the background color to black with yellow letters">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
';

// view modules
require_once("views/common_language.php");

// SITE MODULES
$modulesList = Module::getAllmode();

foreach($modulesList as $module):
	$fileName = "module.".$module->mode.".php";
    if(file_exists("views/".$fileName)){
        require_once("views/".$fileName);
	}
endforeach;

// view modules
require_once("views/module.user.php");
require_once("views/module.cart.php");
require_once("views/module.contact.php");
require_once("views/module.header.php");
require_once("views/module.footer.php");

?>