<?php
// Load the header files first
header("Expires: 0");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("cache-control: no-store, no-cache, must-revalidate");
header("Pragma: no-cache");

// Load necessary files then...
require_once('../initialize.php');

$action = $_REQUEST['action'];

switch ($action) {

    case "slug":
        $slug = $msg = '';
        if (!empty($_REQUEST['title'])) {
            $nslug = create_slug($_REQUEST['title']);
            $chk = check_slug($_REQUEST['actid'], $nslug);
            if ($chk == '1') {
                $msg = "Slug already exists !";
            } else {
                $slug = $nslug;
            }
        }
        echo json_encode(array('msgs' => $msg, 'result' => $slug));
        break;

    case "add":

        $record = new Product();

        $record->slug          = create_slug($_REQUEST['title']);
        $record->title         = $_REQUEST['title'];
        // $record->title_greek   = $_REQUEST['title_greek'];
        $record->type           = $_REQUEST['type'];

        $record->status        = $_REQUEST['status'];
        $record->sortorder     = Product::find_maximum();
        $record->added_date    = registered();
        $record->modified_date = registered();

        $checkDupliTitle = Product::checkDupliTitle($record->title);
        if ($checkDupliTitle):
            echo json_encode(array("action" => "warning", "message" => "Title Already Exists."));
            exit;
        endif;

        $db->begin();
        if ($record->save()): $db->commit();
            $message = sprintf($GLOBALS['basic']['addedSuccess_'], "Product '" . $record->title . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action("Product [" . $record->title . "]" . $GLOBALS['basic']['addedSuccess'], 1, 3);
        else: $db->rollback();
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['unableToSave']));
        endif;
    break;

    case "edit":
        $record = Product::find_by_id($_REQUEST['idValue']);

        if ($record->title != $_REQUEST['title']) {
            $checkDupliTitle = Product::checkDupliTitle($_REQUEST['title']);
            if ($checkDupliTitle):
                echo json_encode(array("action" => "warning", "message" => "Title already exists."));
                exit;
            endif;
        }

        $record->slug 			= create_slug($_REQUEST['title']);
        $record->title          = $_REQUEST['title'];
        // $record->title_greek    = $_REQUEST['title_greek'];
        $record->type           = $_REQUEST['type'];
        $record->status         = $_REQUEST['status'];
        $record->modified_date  = registered();

        $db->begin();
        if ($record->save()):$db->commit();
            $message = sprintf($GLOBALS['basic']['changesSaved_'], "Product '" . $record->title . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action("Product " . $record->title . " Edit Successfully", 1, 4);
        else:$db->rollback();
            echo json_encode(array("action" => "notice", "message" => $GLOBALS['basic']['noChanges']));
        endif;
    break;

    case "delete":
        $id         = $_REQUEST['id'];
        $record     = Product::find_by_id($id);
        log_action("Product [" . $record->title . "]" . $GLOBALS['basic']['deletedSuccess'], 1, 6);
        $db->begin();
        $res        = $db->query("DELETE FROM tbl_product WHERE id='{$id}'");
        if ($res):
            $subpkgids = $db->fetch_array($db->query("SELECT id from tbl_product_sub WHERE type='{$id}'"));
            if (!empty($subpkgids)) {
                foreach ($subpkgids as $k => $v) {
                    $db->query("DELETE FROM tbl_subproduct_images WHERE sid='{$v}'");
                }
            }
            $db->query("DELETE FROM tbl_product_sub WHERE type='{$id}'");
            $db->commit();
        else: $db->rollback(); endif;
        reOrder("tbl_product", "sortorder");
        reOrder("tbl_product_sub", "sortorder");
        reOrder('tbl_subproduct_images', "sortorder");
        echo json_encode(array("action" => "success", "message" => "Product [" . $record->title . "]" . $GLOBALS['basic']['deletedSuccess']));
    break;

    case "toggleStatus":
        $id             = $_REQUEST['id'];
        $record         = Product::find_by_id($id);
        $record->status = ($record->status == 1) ? 0 : 1;
        $db->begin();
        $res            = $record->save();
        if ($res): $db->commit();
        else: $db->rollback(); endif;
        echo "";
    break;

    case "bulkToggleStatus":
        $id         = $_REQUEST['idArray'];
        $allid      = explode("|", $id);
        $return     = "0";
        for ($i = 1; $i < count($allid); $i++) {
            $record = Product::find_by_id($allid[$i]);
            $record->status = ($record->status == 1) ? 0 : 1;
            $record->save();
        }
        echo "";
    break;

    case "bulkDelete":
        $id         = $_REQUEST['idArray'];
        $allid      = explode("|", $id);
        $return     = "0";
        $db->begin();
        for ($i = 1; $i < count($allid); $i++) {
            $subpkgids = $db->fetch_array($db->query("SELECT id from tbl_product_sub WHERE type='{$allid[$i]}'"));
            if (!empty($subpkgids)) {
                foreach ($subpkgids as $k => $v) {
                    $db->query("DELETE FROM tbl_subproduct_images WHERE sid='{$v}'");
                }
            }
            $db->query("DELETE FROM tbl_product_sub WHERE type='" . $allid[$i] . "'");
            $res = $db->query("DELETE FROM tbl_product WHERE id='" . $allid[$i] . "'");
            $return = 1;
        }
        if ($res) $db->commit(); else $db->rollback();
        reOrder("tbl_product", "sortorder");
        reOrder("tbl_product_sub", "sortorder");
        reOrder('tbl_subproduct_images', "sortorder");
        if ($return == 1):
            $message = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "Product");
            echo json_encode(array("action" => "success", "message" => $message));
        else:
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['noRecords']));
        endif;
    break;

    case "sort":
        $id         = $_REQUEST['id'];    // IS a line containing ids starting with : sortIds
        $sortIds    = $_REQUEST['sortIds'];
        datatableReordering('tbl_product', $sortIds, "sortorder", '', '', 1);
        $message    = sprintf($GLOBALS['basic']['sorted_'], "Product ");
        echo json_encode(array("action" => "success", "message" => $message));
    break;

    case "setProductType":
        $session->set('type_id_product', $_REQUEST['type_id']);
        echo json_encode(array("action" => "success", "message" => "Product type updated successfully"));
    break;


    /************************** Sub Product ***************************/
    case "addSubProduct":
        $record	= new SubProduct();

        $record->type 			    = $_REQUEST['type'];
        $record->slug 			    = create_slug($_REQUEST['title']);
        $record->title 			    = $_REQUEST['title'];
        $record->title_greek        = (!empty($_REQUEST['title_greek'])) ? $_REQUEST['title_greek'] : '';
        $record->tag                = (!empty($_REQUEST['tag'])) ? $_REQUEST['tag'] : '';
        $record->currency 			= $_REQUEST['currency'];
        $record->netqnt1 			= $_REQUEST['netqnt1'];
        // $record->qnt1 			    = $_REQUEST['qnt1'];
        $record->price1 			= $_REQUEST['price1'];
        $record->discount1 		    = !empty($_REQUEST['discount1'])?$_REQUEST['discount1']:'';
        $record->netqnt2 		    = !empty($_REQUEST['netqnt2'])?$_REQUEST['netqnt2']:'';
        $record->qnt2 		        = !empty($_REQUEST['qnt2'])?$_REQUEST['qnt2']:'';
        $record->price2 		    = !empty($_REQUEST['price2'])?$_REQUEST['price2']:'';
        $record->discount2 		    = !empty($_REQUEST['discount2'])?$_REQUEST['discount2']:'';
        $record->netqnt3 		    = !empty($_REQUEST['netqnt3'])?$_REQUEST['netqnt3']:'';
        $record->qnt3 		        = !empty($_REQUEST['qnt3'])?$_REQUEST['qnt3']:'';
        $record->price3 		    = !empty($_REQUEST['price3'])?$_REQUEST['price3']:'';
        $record->discount3 		    = !empty($_REQUEST['discount3'])?$_REQUEST['discount3']:'';
        $record->netqnt4 		    = !empty($_REQUEST['netqnt4'])?$_REQUEST['netqnt4']:'';
        $record->qnt4 		        = !empty($_REQUEST['qnt4'])?$_REQUEST['qnt4']:'';
        $record->price4 		    = !empty($_REQUEST['price4'])?$_REQUEST['price4']:'';
        $record->discount4 		    = !empty($_REQUEST['discount4'])?$_REQUEST['discount4']:'';
        $record->banner_image	    = !empty($_REQUEST['imageArrayname2'])?$_REQUEST['imageArrayname2']:'';
        $record->brief 		        = !empty($_REQUEST['brief'])?$_REQUEST['brief']:'';
        $record->brief_greek        = !empty($_REQUEST['brief_greek'])?$_REQUEST['brief_greek']:'';
        $record->content 		    = $_REQUEST['content'];
        // $record->content_greek 		= $_REQUEST['content_greek'];
        $record->status			    = $_REQUEST['status'];

        $record->meta_title		        = $_REQUEST['meta_title'];
        $record->meta_keywords		    = $_REQUEST['meta_keywords'];
        $record->meta_description	    = $_REQUEST['meta_description'];
        // $record->meta_title_greek		= $_REQUEST['meta_title_greek'];
        // $record->meta_keywords_greek	= $_REQUEST['meta_keywords_greek'];
        // $record->meta_description_greek	= $_REQUEST['meta_description_greek'];

        $record->sortorder		= SubProduct::find_maximum_byparent("sortorder",$_REQUEST['type']);
        $record->added_date 	= registered();
        $record->modified_date  = registered();

        $checkDupliTitle = SubProduct::checkDupliTitle($record->title);
        if ($checkDupliTitle):
            echo json_encode(array("action" => "warning", "message" => "Title Already Exists."));
            exit;
        endif;

        $db->begin();
        if ($record->save()): $db->commit();
            $message = sprintf($GLOBALS['basic']['addedSuccess_'], "Sub Product '" . $record->title . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action($message, 1, 3);
        else: $db->rollback();
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['unableToSave']));
        endif;
    break;

    case "editSubProduct":

        $record = SubProduct::find_by_id($_REQUEST['idValue']);

        if ($record->title != $_REQUEST['title']) {
            $checkDupliTitle = SubProduct::checkDupliTitle($_REQUEST['title']);
            if ($checkDupliTitle):
                echo json_encode(array("action" => "warning", "message" => "Title already exists."));
                exit;
            endif;
        }

        $record->type 			    = $_REQUEST['type'];
        $record->slug 			    = create_slug($_REQUEST['title']);
        $record->title 			    = $_REQUEST['title'];
        $record->title_greek        = (!empty($_REQUEST['title_greek'])) ? $_REQUEST['title_greek'] : '';
        $record->tag                = (!empty($_REQUEST['tag'])) ? $_REQUEST['tag'] : '';
        $record->currency 			= $_REQUEST['currency'];
        $record->netqnt1 			= $_REQUEST['netqnt1'];
        // $record->qnt1 			    = $_REQUEST['qnt1'];
        $record->price1 			= $_REQUEST['price1'];
        $record->discount1 		    = !empty($_REQUEST['discount1'])?$_REQUEST['discount1']:'';
        $record->netqnt2 		    = !empty($_REQUEST['netqnt2'])?$_REQUEST['netqnt2']:'';
        $record->qnt2 		        = !empty($_REQUEST['qnt2'])?$_REQUEST['qnt2']:'';
        $record->price2 		    = !empty($_REQUEST['price2'])?$_REQUEST['price2']:'';
        $record->discount2 		    = !empty($_REQUEST['discount2'])?$_REQUEST['discount2']:'';
        $record->netqnt3 		    = !empty($_REQUEST['netqnt3'])?$_REQUEST['netqnt3']:'';
        $record->qnt3 		        = !empty($_REQUEST['qnt3'])?$_REQUEST['qnt3']:'';
        $record->price3 		    = !empty($_REQUEST['price3'])?$_REQUEST['price3']:'';
        $record->discount3 		    = !empty($_REQUEST['discount3'])?$_REQUEST['discount3']:'';
        $record->netqnt4 		    = !empty($_REQUEST['netqnt4'])?$_REQUEST['netqnt4']:'';
        $record->qnt4 		        = !empty($_REQUEST['qnt4'])?$_REQUEST['qnt4']:'';
        $record->price4 		    = !empty($_REQUEST['price4'])?$_REQUEST['price4']:'';
        $record->discount4 		    = !empty($_REQUEST['discount4'])?$_REQUEST['discount4']:'';
        $record->banner_image	    = !empty($_REQUEST['imageArrayname2'])?$_REQUEST['imageArrayname2']:'';
        $record->brief 		        = !empty($_REQUEST['brief'])?$_REQUEST['brief']:'';
        $record->brief_greek        = !empty($_REQUEST['brief_greek'])?$_REQUEST['brief_greek']:'';
        $record->content 		    = $_REQUEST['content'];
        // $record->content_greek 		= $_REQUEST['content_greek'];
        $record->status			    = $_REQUEST['status'];

        $record->meta_title		        = $_REQUEST['meta_title'];
        $record->meta_keywords		    = $_REQUEST['meta_keywords'];
        $record->meta_description	    = $_REQUEST['meta_description'];
        // $record->meta_title_greek		= $_REQUEST['meta_title_greek'];
        // $record->meta_keywords_greek	= $_REQUEST['meta_keywords_greek'];
        // $record->meta_description_greek	= $_REQUEST['meta_description_greek'];

        $record->modified_date      = registered();

        $db->begin();

        if ($record->save()): $db->commit();
            $message = sprintf($GLOBALS['basic']['changesSaved_'], "Sub Product '" . $record->title . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action($message, 1, 4);
        else: $db->rollback();
            echo json_encode(array("action" => "notice", "message" => $GLOBALS['basic']['noChanges']));
        endif;
    break;

    case "deleteSubProduct":
        $id         = $_REQUEST['id'];
        $record     = SubProduct::find_by_id($id);
        log_action("Sub Product [".$record->title."]".$GLOBALS['basic']['deletedSuccess'],1,6);
        $db->begin();

        $res = $db->query("DELETE FROM tbl_product_sub WHERE id='{$id}'");
        $db->query("DELETE FROM tbl_subproduct_images WHERE sid='{$id}'");
        if ($res): $db->commit();
        else: $db->rollback(); endif;
        reOrder("tbl_product_sub", "sortorder");
        echo json_encode(array("action"=>"success","message"=>"Sub Product [".$record->title."]".$GLOBALS['basic']['deletedSuccess']));
    break;

    case "SubtoggleStatus":
        $id             = $_REQUEST['id'];
        $record         = SubProduct::find_by_id($id);
        $record->status = ($record->status == 1) ? 0 : 1 ;
        $db->begin();
        $res            = $record->save();
        if($res): $db->commit();
        else: $db->rollback(); endif;
        echo "";
    break;

    case "subbulkToggleStatus":
        $id         = $_REQUEST['idArray'];
        $allid      = explode("|", $id);
        $return     = "0";
        for($i=1; $i<count($allid); $i++){
            $record = SubProduct::find_by_id($allid[$i]);
            $record->status = ($record->status == 1) ? 0 : 1 ;
            $record->save();
        }
        echo "";
    break;

    case "subbulkDelete":
        $id         = $_REQUEST['idArray'];
        $allid      = explode("|", $id);
        $return     = "0";
        $db->begin();
        for ($i = 1; $i < count($allid); $i++) {
            $record = SubProduct::find_by_id($allid[$i]);
            $res = $db->query("DELETE FROM tbl_product_sub WHERE id='" . $allid[$i] . "'");
            $db->query("DELETE FROM tbl_subproduct_images WHERE sid='" . $allid[$i] . "'");
            reOrderSub("tbl_product_sub", "sortorder", "type", $record->type);
            $return = 1;
        }
        if ($res) $db->commit(); else $db->rollback();

        if ($return == 1):
            $message = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "Sub Product");
            echo json_encode(array("action" => "success", "message" => $message));
        else:
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['noRecords']));
        endif;
    break;

    case "subSort":
        $id 	 = $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
        $sortIds = $_REQUEST['sortIds'];
        $posId   = SubProduct::field_by_id($id,'type');
        datatableReordering('tbl_product_sub', $sortIds, "sortorder", "type", $posId, 1);
        $message  = sprintf($GLOBALS['basic']['sorted_'], "Sub Product");
        echo json_encode(array("action"=>"success","message"=>$message));
    break;


    /************************** Sub Product Image *****************************/
    case "addSubProductImage":
        $sid    = $_REQUEST['sid'];

        $imageName  = !empty($_REQUEST['imageArrayname']) ? $_REQUEST['imageArrayname'] : '';
        $title      = !empty($_REQUEST['title']) ? $_REQUEST['title'] : '';

        if (!empty($imageName)):
            foreach ($imageName as $key => $val):
                $FimageName     = $imageName[$key];
                $Ftitle         = $title[$key];

                //Save Record
                if (!empty($FimageName)):
                    $Gallery = new SubProductImage();

                    $Gallery->image     = $FimageName;
                    $Gallery->title     = $Ftitle;
                    $Gallery->status    = 1;
                    $Gallery->sid       = $sid;
                    $Gallery->sortorder = SubProductImage::find_maximum_byparent("sortorder", $sid);
                    $Gallery->added_date = registered();

                    $db->begin();
                    $res = $Gallery->save();
                    if ($res): $db->commit();
                    else: $db->rollback(); endif;

                    log_action("Sub Product Image [" . $Gallery->title . "]" . $GLOBALS['basic']['addedSuccess'], 1, 3);
                endif;
            endforeach;
            echo json_encode(array("action" => "success", "message" => $GLOBALS['basic']['changesSaved'], "sid" => $sid));
        else:
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['unableToSave']));
        endif;

    break;

    case "deleteSubimage":
        $id         = $_REQUEST['id'];
        $record     = SubProductImage::find_by_id($id);
        log_action("Sub Product Image [" . $record->title . "]" . $GLOBALS['basic']['deletedSuccess'], 1, 6);
        $db->begin();
        $res        = $db->query("DELETE FROM tbl_subproduct_images WHERE id='{$id}'");
        if ($res): $db->commit();
        else: $db->rollback(); endif;
        reOrderSub("tbl_subproduct_images", "sortorder", "sid", $record->sid);
        echo json_encode(array("action" => "success"));
    break;

    case "editSubGalleryImageText":

        $GalleryImage = SubProductImage::find_by_id($_REQUEST['id']);
        if (!empty($GalleryImage)) {
            $GalleryImage->title = $_REQUEST['title'];
            $db->begin();
            if ($GalleryImage->save()): $db->commit();
                $message = sprintf($GLOBALS['basic']['changesSaved_'], "Sub Product Image '" . $GalleryImage->title . "'");
                echo json_encode(array("action" => "success", "message" => $message));
                log_action("Sub Product Image [" . $GalleryImage->title . "] Edit Successfully", 1, 4);
            else:$db->rollback();
                echo json_encode(array("action" => "notice", "message" => $GLOBALS['basic']['noChanges']));
            endif;
        } else {
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['unableToSave']));
        }

    break;

    case "SubitoggleStatus":
        $id             = $_REQUEST['id'];
        $record         = SubProductImage::find_by_id($id);
        $record->status = ($record->status == 1) ? 0 : 1;
        $db->begin();
        $res            = $record->save();
        if ($res): $db->commit();
        else: $db->rollback(); endif;
        echo "";
    break;

    case "sortSubGalley":
        $id         = $_REQUEST['id'];    // IS a line containing ids starting with : sortIds
        $record     = SubProductImage::find_by_id($id);
        $sortIds    = $_REQUEST['sortIds'];

        datatableReordering('tbl_subproduct_images', $sortIds, "sortorder", 'sid', $record->sid, 0);
        reOrder('tbl_subproduct_images', "sortorder");
        echo json_encode(array("action" => "success", "message" => $GLOBALS['basic']['sorted']));
    break;
}
