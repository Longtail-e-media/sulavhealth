<?php
// Load the header files first
header("Expires: 0");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("cache-control: no-store, no-cache, must-revalidate");
header("Pragma: no-cache");

// Load necessary files then...
require_once('../initialize.php');

$action = $_REQUEST['action'];

switch($action)
{

    case "add":
        $record = new Site();

        // $record->slug 		            = create_slug($_REQUEST['title']);
        $record->title 		            = $_REQUEST['title'];
        $record->parentId               = $_REQUEST['parentId'];
        $record->delivery_charge        = $_REQUEST['delivery_charge'];
        $record->latitude               = $_REQUEST['latitude'];
        $record->longitude              = $_REQUEST['longitude'];
        $record->contact_no             = $_REQUEST['contact_no'];
//			$record->sub_title 		        = $_REQUEST['sub_title'];
        // $record->image		            = serialize(array_values(array_filter($_REQUEST['imageArrayname'])));
        $record->status		            = $_REQUEST['status'];
        // $record->homepage	            = $_REQUEST['homepage'];
        $record->sortorder	            = Site::find_maximum();
        $record->added_date             = registered();
        $record->modified_date          = registered();

        $checkDupliName = Site::checkDupliName($record->title);
        if($checkDupliName):
            echo json_encode(array("action"=>"warning","message"=>"Title Already Exists."));
            exit;
        endif;
        $db->begin();
        if($record->save()): $db->commit();
            $message  = sprintf($GLOBALS['basic']['addedSuccess_'], "Site '".$record->title."'");
            echo json_encode(array("action"=>"success","message"=>$message));
            log_action($message,1,3);
        else:
            $db->rollback(); echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
        endif;
        break;

    case "edit":
        $record = Site::find_by_id($_REQUEST['idValue']);

        if($record->title!=$_REQUEST['title']){
            $checkDupliName=Site::checkDupliName($_REQUEST['title']);
            if($checkDupliName):
                echo json_encode(array("action"=>"warning","message"=>"Title already exists."));
                exit;
            endif;
        }

        // $record->slug 		            = create_slug($_REQUEST['title']);
        $record->title 		            = $_REQUEST['title'];
        $record->parentId               = $_REQUEST['parentId'];
        $record->delivery_charge        = $_REQUEST['delivery_charge'];
        $record->latitude               = $_REQUEST['latitude'];
        $record->longitude              = $_REQUEST['longitude'];
        $record->contact_no             = $_REQUEST['contact_no'];
        // $record->image		            = serialize(array_values(array_filter($_REQUEST['imageArrayname'])));
        $record->status		            = $_REQUEST['status'];
        // $record->homepage	            = $_REQUEST['homepage'];
        $record->modified_date          = registered();

        $db->begin();
        if($record->save()):$db->commit();
            $message  = sprintf($GLOBALS['basic']['changesSaved_'], "Site '".$record->title."'");
            echo json_encode(array("action"=>"success","message"=>$message));
            log_action($message,1,4);
        else: $db->rollback();echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
        endif;
        break;

    case "delete":
        $id         = $_REQUEST['id'];
        $record     = Site::find_by_id($id);
        $db->begin();
        $res        = $db->query("DELETE FROM tbl_sites WHERE id='{$id}'");
        if($res):$db->commit();	else: $db->rollback();endif;
        reOrder("tbl_sites", "sortorder");
        $message    = sprintf($GLOBALS['basic']['deletedSuccess_'], "Site '".$record->title."'");
        echo json_encode(array("action"=>"success","message"=>$message));
        log_action("Site [".$record->title."]".$GLOBALS['basic']['deletedSuccess'],1,6);
        break;

    // Module Setting Sections  >> <<
    case "toggleStatus":
        $id             = $_REQUEST['id'];
        $record         = Site::find_by_id($id);
        $record->status = ($record->status == 1) ? 0 : 1 ;
        $record->save();
        echo "";
        break;

    case "bulkToggleStatus":
        $id         = $_REQUEST['idArray'];
        $allid      = explode("|", $id);
        $return     = "0";
        for($i=1; $i<count($allid); $i++){
            $record = Site::find_by_id($allid[$i]);
            $record->status = ($record->status == 1) ? 0 : 1 ;
            $record->save();
        }
        echo "";
        break;

    case "bulkDelete":
        $id         = $_REQUEST['idArray'];
        $allid      = explode("|", $id);
        $return     = "0";
        $db->begin();
        for($i=1; $i<count($allid); $i++){
            $res  = $db->query("DELETE FROM tbl_sites WHERE id='".$allid[$i]."'");
            $return = 1;
        }
        if($res)$db->commit();else $db->rollback();
        reOrder("tbl_sites", "sortorder");

        if($return==1):
            $message  = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "Site");
            echo json_encode(array("action"=>"success","message"=>$message));
        else:
            echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['noRecords']));
        endif;
        break;

    case "sort":
        $id 	 = $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
        $sortIds = $_REQUEST['sortIds'];
        datatableReordering('tbl_sites', $sortIds, "sortorder", '','',1);
        $message  = sprintf($GLOBALS['basic']['sorted_'], "Site");
        echo json_encode(array("action"=>"success","message"=>$message));
        break;
}
?>