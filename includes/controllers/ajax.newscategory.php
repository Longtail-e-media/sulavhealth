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
        $record = new NewsCategory();

        $record->slug       = create_slug($_REQUEST['title']);
        $record->title      = $_REQUEST['title'];
        // $record->title_greek = $_REQUEST['title_greek'];

        $record->status     = $_REQUEST['status'];
        $record->sortorder  = NewsCategory::find_maximum();
        $record->added_date = registered();
        $record->modified_date = registered();

        $checkDupliName = NewsCategory::checkDupliName($record->title);
        if ($checkDupliName):
            echo json_encode(array("action" => "warning", "message" => "Title Already Exists."));
            exit;
        endif;

        $db->begin();
        if ($record->save()): $db->commit();
            $message = sprintf($GLOBALS['basic']['addedSuccess_'], "News Category '" . $record->title . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action($message, 1, 3);
        else:
            $db->rollback();
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['unableToSave']));
        endif;
    break;

    case "edit":
        $record = NewsCategory::find_by_id($_REQUEST['idValue']);

        if ($record->title != $_REQUEST['title']) {
            $checkDupliName = NewsCategory::checkDupliName($_REQUEST['title']);
            if ($checkDupliName):
                echo json_encode(array("action" => "warning", "message" => "Title already exists."));
                exit;
            endif;
        }

        $record->slug       = create_slug($_REQUEST['title']);
        $record->title      = $_REQUEST['title'];
        // $record->title_greek = $_REQUEST['title_greek'];
        $record->status     = $_REQUEST['status'];
        $record->modified_date = registered();

        $db->begin();
        if ($record->save()):$db->commit();
            $message = sprintf($GLOBALS['basic']['changesSaved_'], "News Category '" . $record->title . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action($message, 1, 4);
        else: $db->rollback();
            echo json_encode(array("action" => "notice", "message" => $GLOBALS['basic']['noChanges']));
        endif;
    break;

    case "delete":
        $id         = $_REQUEST['id'];
        $record     = NewsCategory::find_by_id($id);
        $db->begin();
        $res        = $db->query("DELETE FROM tbl_news_category WHERE id='{$id}'");
        if ($res): $db->commit(); else: $db->rollback();endif;
        reOrder("tbl_news_category", "sortorder");
        $message    = sprintf($GLOBALS['basic']['deletedSuccess_'], "News Category '" . $record->title . "'");
        echo json_encode(array("action" => "success", "message" => $message));
        log_action("News Category [" . $record->title . "]" . $GLOBALS['basic']['deletedSuccess'], 1, 6);
        break;

    // Module Setting Sections  >> <<
    case "toggleStatus":
        $id             = $_REQUEST['id'];
        $record         = NewsCategory::find_by_id($id);
        $record->status = ($record->status == 1) ? 0 : 1;
        $record->save();
        echo "";
        break;

    case "bulkToggleStatus":
        $id         = $_REQUEST['idArray'];
        $allid      = explode("|", $id);
        $return     = "0";
        for ($i = 1; $i < count($allid); $i++) {
            $record = NewsCategory::find_by_id($allid[$i]);
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
            $res = $db->query("DELETE FROM tbl_news_category WHERE id='" . $allid[$i] . "'");
            deleteSlug('Article', $allid[$i]);
            $return = 1;
        }
        if ($res) $db->commit(); else $db->rollback();
        reOrder("tbl_news_category", "sortorder");

        if ($return == 1):
            $message = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "News Category");
            echo json_encode(array("action" => "success", "message" => $message));
        else:
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['noRecords']));
        endif;
        break;

    case "sort":
        $id         = $_REQUEST['id'];    // IS a line containing ids starting with : sortIds
        $sortIds    = $_REQUEST['sortIds'];
        datatableReordering('tbl_news_category', $sortIds, "sortorder", '', '', 1);
        $message    = sprintf($GLOBALS['basic']['sorted_'], "News Category");
        echo json_encode(array("action" => "success", "message" => $message));
        break;
}
?>