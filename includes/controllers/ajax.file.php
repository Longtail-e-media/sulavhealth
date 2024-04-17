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
            if(empty($_REQUEST['imageArrayname'])):
                echo json_encode(array("action"=>"warning","message"=>"Required Upload File !"));
                exit;
            endif;

			$record = new File();
			
			$record->title 			= $_REQUEST['title'];
			$record->file		    = $_REQUEST['imageArrayname'];
			$record->status			= $_REQUEST['status'];
			$record->sortorder		= File::find_maximum();
			$record->added_date 	= registered();

			$db->begin();
			if($record->save()): $db->commit();
			   $message  = sprintf($GLOBALS['basic']['addedSuccess_'], "File '".$record->title."'");
			echo json_encode(array("action"=>"success","message"=>$message));
				log_action("File [".$record->title."]".$GLOBALS['basic']['addedSuccess'],1,3);
			else: $db->rollback();
				echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
			endif;
		break;
			
		case "edit":
            if(empty($_REQUEST['imageArrayname'])):
                echo json_encode(array("action"=>"warning","message"=>"Required Upload File !"));
                exit;
            endif;

			$record = File::find_by_id($_REQUEST['idValue']);
			
			$record->title 			= $_REQUEST['title'];
			$record->file			= $_REQUEST['imageArrayname'];
			$record->status			= $_REQUEST['status'];
			$record->modified_date 	= registered();
	
			$db->begin();
			if($record->save()): $db->commit();
			   $message  = sprintf($GLOBALS['basic']['changesSaved_'], "File '".$record->title."'");
			   echo json_encode(array("action"=>"success","message"=>$message));
			   log_action("File [".$record->title."] Edit Successfully",1,4);
			else: $db->rollback(); echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
			endif;
		break;
			
		case "delete":
			$id = $_REQUEST['id'];
			$record = File::find_by_id($id);
			log_action("Files  [".$record->title."]".$GLOBALS['basic']['deletedSuccess'],1,6);
			$db->query("DELETE FROM tbl_file WHERE id='{$id}'");
			
			reOrder("tbl_file", "sortorder");
			
			$message  = sprintf($GLOBALS['basic']['deletedSuccess_'], "File '".$record->title."'");
			echo json_encode(array("action"=>"success","message"=>$message));					
			log_action("File [".$record->title."]".$GLOBALS['basic']['deletedSuccess'],1,6);
		break;
		
		// Module Setting Sections  >> <<
		case "toggleStatus":
			$id = $_REQUEST['id'];
			$record = File::find_by_id($id);
			$record->status = ($record->status == 1) ? 0 : 1 ;
			$record->save();
			echo "";
		break;
			
		case "bulkToggleStatus":
			$id = $_REQUEST['idArray'];
			$allid = explode("|", $id);
			$return = "0";
			for($i=1; $i<count($allid); $i++){
				$record = File::find_by_id($allid[$i]);
				$record->status = ($record->status == 1) ? 0 : 1 ;
				$record->save();
			}
			echo "";
		break;
			
		case "bulkDelete":
			$id = $_REQUEST['idArray'];
			$allid = explode("|", $id);
			$return = "0";
			$db->begin();
			for($i=1; $i<count($allid); $i++){
				$record = File::find_by_id($allid[$i]);
				log_action("File [".$record->title."]".$GLOBALS['basic']['deletedSuccess'],1,6);
				$res = $db->query("DELETE FROM tbl_file WHERE id='".$allid[$i]."'");
				$return = 1;
			}
			if($res)$db->commit();else $db->rollback();
			reOrder("tbl_file", "sortorder");
			
			if($return==1):
				$message  = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "File");
				echo json_encode(array("action"=>"success","message"=>$message));
			else:
				echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['noRecords']));
			endif;
		break;
			
		case "sort":			
			$id 	 = $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
			$sortIds = $_REQUEST['sortIds'];;
            datatableReordering('tbl_file', $sortIds, "sortorder", "", "", 1);
			$message  = sprintf($GLOBALS['basic']['sorted_'], "File");
			echo json_encode(array("action"=>"success","message"=>$message));
		break;
	}
?>