<?php
/*
* Home page 
*/
$resinnh = '';

if (defined('HOME_PAGE')) {
    $recInn = Services::getservice_list(4);
    // echo "<pre>"; print_r($recInn); die();
    if (!empty($recInn)) {
        $resinnh .= '<ul class="row">';
        foreach ($recInn as $innRow) {
    $resinnh .= '<li class="col-sm-6 col-md-3"> <i class="'.$innRow->icon.'"></i>
                      <h5> ' . (($lang == "gr") ? $innRow->title_greek : $innRow->title) . '</h5>
                      <p>' . (($lang == "gr") ? substr(strip_tags($innRow->content_greek),0,20000) : substr(strip_tags($innRow->content),0,20000)) . '</p>
                    </li>';
        }
         $resinnh .= '</ul>';
    }

}

$jVars['module:home-services'] = $resinnh;

?>