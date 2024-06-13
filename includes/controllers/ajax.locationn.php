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
			$record = new locationn();
			
			// $record->slug 		            = create_slug($_REQUEST['title']);
			$record->title 		            = $_REQUEST['title'];
            $record->parentId               = $_REQUEST['parentId'];
            $record->delivery_charge        = $_REQUEST['delivery_charge'];
            $record->latitude               = $_REQUEST['latitude'];
            $record->longitude              = $_REQUEST['longitude'];
//			$record->sub_title 		        = $_REQUEST['sub_title'];
			// $record->image		            = serialize(array_values(array_filter($_REQUEST['imageArrayname'])));
			$record->status		            = $_REQUEST['status'];
			// $record->homepage	            = $_REQUEST['homepage'];
			$record->sortorder	            = locationn::find_maximum();
			$record->added_date             = registered();
			$record->modified_date          = registered();

			$checkDupliName = locationn::checkDupliName($record->title);
			if($checkDupliName):
				echo json_encode(array("action"=>"warning","message"=>"Title Already Exists."));
				exit;		
			endif;
			$db->begin();
			if($record->save()): $db->commit();
				$message  = sprintf($GLOBALS['basic']['addedSuccess_'], "location '".$record->title."'");
				echo json_encode(array("action"=>"success","message"=>$message));
				log_action($message,1,3);
			else: 
				$db->rollback(); echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
			endif;
		break;
			
		case "edit":
			$record = locationn::find_by_id($_REQUEST['idValue']);
			
			if($record->title!=$_REQUEST['title']){
				$checkDupliName=locationn::checkDupliName($_REQUEST['title']);
				if($checkDupliName):
					echo json_encode(array("action"=>"warning","message"=>"title is already exist."));
					exit;		
				endif;
			}
			
			// $record->slug 		            = create_slug($_REQUEST['title']);
			$record->title 		            = $_REQUEST['title'];
            $record->parentId               = $_REQUEST['parentId'];
            $record->delivery_charge        = $_REQUEST['delivery_charge'];
            $record->latitude               = $_REQUEST['latitude'];
            $record->longitude              = $_REQUEST['longitude'];
			// $record->image		            = serialize(array_values(array_filter($_REQUEST['imageArrayname'])));
			$record->status		            = $_REQUEST['status'];
			// $record->homepage	            = $_REQUEST['homepage'];
            $record->modified_date          = registered();

			$db->begin();
			if($record->save()):$db->commit();
			   	$message  = sprintf($GLOBALS['basic']['changesSaved_'], "location '".$record->title."'");
			   	echo json_encode(array("action"=>"success","message"=>$message));
			   	log_action($message,1,4);
			else: $db->rollback();echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
			endif;
		break;
			
		case "delete":
			$id         = $_REQUEST['id'];
			$record     = locationn::find_by_id($id);
			$db->begin();
			$res        = $db->query("DELETE FROM tbl_location WHERE id='{$id}'");
			if($res):$db->commit();	else: $db->rollback();endif;
			reOrder("tbl_location", "sortorder");
			$message    = sprintf($GLOBALS['basic']['deletedSuccess_'], "location '".$record->title."'");
			echo json_encode(array("action"=>"success","message"=>$message));	
			log_action("location [".$record->title."]".$GLOBALS['basic']['deletedSuccess'],1,6);
		break;
		
		// Module Setting Sections  >> <<
		case "toggleStatus":
			$id             = $_REQUEST['id'];
			$record         = locationn::find_by_id($id);
			$record->status = ($record->status == 1) ? 0 : 1 ;
			$record->save();
			echo "";
		break;
			
		case "bulkToggleStatus":
			$id         = $_REQUEST['idArray'];
			$allid      = explode("|", $id);
			$return     = "0";
			for($i=1; $i<count($allid); $i++){
				$record = locationn::find_by_id($allid[$i]);
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
				$res  = $db->query("DELETE FROM tbl_location WHERE id='".$allid[$i]."'");
				$return = 1;
			}
			if($res)$db->commit();else $db->rollback();
			reOrder("tbl_location", "sortorder");
			
			if($return==1):
			    $message  = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "location");
				echo json_encode(array("action"=>"success","message"=>$message));
			else:
				echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['noRecords']));
			endif;
		break;
			
		case "sort":			
			$id 	 = $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
			$sortIds = $_REQUEST['sortIds'];
			datatableReordering('tbl_location', $sortIds, "sortorder", '','',1);
			$message  = sprintf($GLOBALS['basic']['sorted_'], "location");
			echo json_encode(array("action"=>"success","message"=>$message));
		break;
	}
?>