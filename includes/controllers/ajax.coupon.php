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
    case "code":
        $code = $msg = '';
        $newCode = randomKeys(10);
        $chk = Coupon::checkDupliCode($newCode);
        if ($chk == '1') {
            $msg = "Code already exists !";
        } else {
            $code = $newCode;
        }
        echo json_encode(array('msgs' => $msg, 'result' => $code));
        break;

    case "add":
        $record = new Coupon();

        $record->slug           = create_slug($_REQUEST['title']);
        $record->title          = $_REQUEST['title'];
        $record->title_greek    = (!empty($_REQUEST['title_greek'])) ? $_REQUEST['title_greek'] : '';
        $record->code           = $_REQUEST['code'];
        $record->discount       = $_REQUEST['discount'];
        $record->start_date     = $_REQUEST['start_date'];
        $record->end_date       = $_REQUEST['end_date'];

        $record->status         = $_REQUEST['status'];
        $record->sortorder      = Coupon::find_maximum();
        $record->added_date     = registered();
        $record->modified_date  = registered();

        $checkDupliName = Coupon::checkDupliName($record->title);
        if ($checkDupliName):
            echo json_encode(array("action" => "warning", "message" => "Title Already Exists."));
            exit;
        endif;

        $checkDupliCode = Coupon::checkDupliCode($record->code);
        if ($checkDupliCode):
            echo json_encode(array("action" => "warning", "message" => "Code Already Exists."));
            exit;
        endif;

        $db->begin();
        if ($record->save()): $db->commit();
            $message = sprintf($GLOBALS['basic']['addedSuccess_'], "Coupon '" . $record->title . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action($message, 1, 3);
        else:
            $db->rollback();
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['unableToSave']));
        endif;
    break;

    case "edit":
        $record = Coupon::find_by_id($_REQUEST['idValue']);

        if ($record->title != $_REQUEST['title']) {
            $checkDupliName = Coupon::checkDupliName($_REQUEST['title']);
            if ($checkDupliName):
                echo json_encode(array("action" => "warning", "message" => "Title  already exists."));
                exit;
            endif;
        }

        if ($record->code != $_REQUEST['code']) {
            $checkDupliCode = Coupon::checkDupliCode($_REQUEST['code']);
            if ($checkDupliCode):
                echo json_encode(array("action" => "warning", "message" => "Code already exists."));
                exit;
            endif;
        }

        $record->slug           = create_slug($_REQUEST['title']);
        $record->title          = $_REQUEST['title'];
        $record->title_greek    = (!empty($_REQUEST['title_greek'])) ? $_REQUEST['title_greek'] : '';
        $record->code           = $_REQUEST['code'];
        $record->discount       = $_REQUEST['discount'];
        $record->start_date     = $_REQUEST['start_date'];
        $record->end_date       = $_REQUEST['end_date'];

        $record->status         = $_REQUEST['status'];
        $record->modified_date  = registered();

        $db->begin();
        if ($record->save()):$db->commit();
            $message = sprintf($GLOBALS['basic']['changesSaved_'], "Coupon '" . $record->title . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action($message, 1, 4);
        else: $db->rollback();
            echo json_encode(array("action" => "notice", "message" => $GLOBALS['basic']['noChanges']));
        endif;
    break;

    case "delete":
        $id         = $_REQUEST['id'];
        $record     = Coupon::find_by_id($id);
        $db->begin();
        $res        = $db->query("DELETE FROM tbl_coupon WHERE id='{$id}'");
        if ($res): $db->commit();
        else: $db->rollback(); endif;
        reOrder("tbl_coupon", "sortorder");
        $message = sprintf($GLOBALS['basic']['deletedSuccess_'], "Coupon '" . $record->title . "'");
        echo json_encode(array("action" => "success", "message" => $message));
        log_action("Coupon [" . $record->title . "]" . $GLOBALS['basic']['deletedSuccess'], 1, 6);
    break;

    // Module Setting Sections  >> <<
    case "toggleStatus":
        $id             = $_REQUEST['id'];
        $record         = Coupon::find_by_id($id);
        $record->status = ($record->status == 1) ? 0 : 1;
        $record->save();
        echo "";
    break;

    case "bulkToggleStatus":
        $id         = $_REQUEST['idArray'];
        $allid      = explode("|", $id);
        $return     = "0";
        for ($i = 1; $i < count($allid); $i++) {
            $record = Coupon::find_by_id($allid[$i]);
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
            $res    = $db->query("DELETE FROM tbl_coupon WHERE id='" . $allid[$i] . "'");
            $return = 1;
        }
        if ($res) $db->commit(); else $db->rollback();
        reOrder("tbl_coupon", "sortorder");

        if ($return == 1):
            $message = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "Coupon");
            echo json_encode(array("action" => "success", "message" => $message));
        else:
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['noRecords']));
        endif;
    break;

    case "sort":
        $id         = $_REQUEST['id'];    // IS a line containing ids starting with : sortIds
        $sortIds    = $_REQUEST['sortIds'];
        datatableReordering('tbl_coupon', $sortIds, "sortorder", '', '', 1);
        $message    = sprintf($GLOBALS['basic']['sorted_'], "Coupon");
        echo json_encode(array("action" => "success", "message" => $message));
    break;
}