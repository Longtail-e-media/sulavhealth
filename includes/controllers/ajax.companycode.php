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
        $newCode    = randomKeys(10);
        $chk        = CompanyCode::checkDupliCode($newCode);
        if ($chk == '1') { $msg = "Code already exists !"; }
        else { $code = $newCode; }
        echo json_encode(array('msgs' => $msg, 'result' => $code));
        break;

    case "add":
        $record = new CompanyCode();

        $record->slug       = create_slug($_REQUEST['title']);
        $record->title      = $_REQUEST['title'];
        $record->code       = $_REQUEST['code'];
        $record->address    = $_REQUEST['address'];
        $record->latitude   = $_REQUEST['latitude'];
        $record->longitude  = $_REQUEST['longitude'];

        $record->status     = $_REQUEST['status'];
        $record->sortorder  = CompanyCode::find_maximum();
        $record->added_date = registered();
        $record->modified_date = registered();

        $checkDupliName     = CompanyCode::checkDupliName($record->title);
        if ($checkDupliName):
            echo json_encode(array("action" => "warning", "message" => "Title Already Exists."));
            exit;
        endif;
        $db->begin();
        if ($record->save()): $db->commit();
            $message    = sprintf($GLOBALS['basic']['addedSuccess_'], "Company '" . $record->title . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action($message, 1, 3);
        else:
            $db->rollback();
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['unableToSave']));
        endif;
        break;

    case "edit":
        $record = CompanyCode::find_by_id($_REQUEST['idValue']);

        if ($record->title != $_REQUEST['title']) {
            $checkDupliName = CompanyCode::checkDupliName($_REQUEST['title']);
            if ($checkDupliName):
                echo json_encode(array("action" => "warning", "message" => "Title already exists."));
                exit;
            endif;
        }

        $record->slug       = create_slug($_REQUEST['title']);
        $record->title      = $_REQUEST['title'];
        $record->code       = $_REQUEST['code'];
        $record->address    = $_REQUEST['address'];
        $record->latitude   = $_REQUEST['latitude'];
        $record->longitude  = $_REQUEST['longitude'];

        $record->status     = $_REQUEST['status'];
        $record->modified_date = registered();

        $db->begin();
        if ($record->save()):$db->commit();
            $message = sprintf($GLOBALS['basic']['changesSaved_'], "Company '" . $record->title . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action($message, 1, 4);
        else: $db->rollback();
            echo json_encode(array("action" => "notice", "message" => $GLOBALS['basic']['noChanges']));
        endif;
        break;

    case "delete":
        $id     = $_REQUEST['id'];
        $record = CompanyCode::find_by_id($id);
        $db->begin();
        $res    = $db->query("DELETE FROM tbl_company_codes WHERE id='{$id}'");
        if ($res): $db->commit(); else: $db->rollback(); endif;
        reOrder("tbl_company_codes", "sortorder");
        $message    = sprintf($GLOBALS['basic']['deletedSuccess_'], "Company '" . $record->title . "'");
        echo json_encode(array("action" => "success", "message" => $message));
        log_action("Brand [" . $record->title . "]" . $GLOBALS['basic']['deletedSuccess'], 1, 6);
        break;

    // Module Setting Sections  >> <<
    case "toggleStatus":
        $id     = $_REQUEST['id'];
        $record = CompanyCode::find_by_id($id);
        $record->status = ($record->status == 1) ? 0 : 1;
        $record->save();
        echo "";
        break;

    case "bulkToggleStatus":
        $id     = $_REQUEST['idArray'];
        $allid  = explode("|", $id);
        $return = "0";
        for ($i = 1; $i < count($allid); $i++) {
            $record         = CompanyCode::find_by_id($allid[$i]);
            $record->status = ($record->status == 1) ? 0 : 1;
            $record->save();
        }
        echo "";
        break;

    case "bulkDelete":
        $id     = $_REQUEST['idArray'];
        $allid  = explode("|", $id);
        $return = "0";
        $db->begin();
        for ($i = 1; $i < count($allid); $i++) {
            $res    = $db->query("DELETE FROM tbl_company_codes WHERE id='" . $allid[$i] . "'");
            $return = 1;
        }
        if ($res) $db->commit(); else $db->rollback();
        reOrder("tbl_company_codes", "sortorder");

        if ($return == 1):
            $message = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "Company");
            echo json_encode(array("action" => "success", "message" => $message));
        else:
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['noRecords']));
        endif;
        break;

    case "sort":
        $id         = $_REQUEST['id'];    // IS a line containing ids starting with : sortIds
        $sortIds    = $_REQUEST['sortIds'];
        datatableReordering('tbl_company_codes', $sortIds, "sortorder", '', '', 1);
        $message    = sprintf($GLOBALS['basic']['sorted_'], "Brand");
        echo json_encode(array("action" => "success", "message" => $message));
        break;
}