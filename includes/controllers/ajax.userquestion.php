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

    case 'addQuestion':
        $record = new Userquestion();

        $record->user_id    = $_REQUEST['user_id'];
        $record->question   = $_REQUEST['question'];
        $record->status     = 0;
        $record->sortorder	= Userquestion::find_maximum();
        $record->added_date = registered();

        $db->begin();
        if ($record->save()):
            $db->commit();
            echo json_encode(array("action" => "success", "message" => "Question successfully sent!"));
        else:
            $db->rollback();
            echo json_encode(array("action" => "error", "message" => "Unable to send!"));
        endif;
    break;
}

?>