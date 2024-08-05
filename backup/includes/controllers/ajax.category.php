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
			
			$category = new category();
			$category->slug 		            = create_slug($_REQUEST['title']);
			$category->parentId 	= $_REQUEST['parentId'];
			$category->title    	= $_REQUEST['title'];	
			// $category->image		= !empty($_REQUEST['imageArrayname']) ? $_REQUEST['imageArrayname'] : '';
			// $category->icon    	= !empty($_REQUEST['fa_icon'])?$_REQUEST['fa_icon']:''; 			
			// $category->brief    	= $_REQUEST['brief'];	
			$category->status		= $_REQUEST['status'];
			$category->sortorder	= category::find_maximum_byparent("sortorder",$_REQUEST['parentId']);
			$category->added_date 	= registered();
			
			$checkDupliTitle = category::checkDupliTitle($category->title,$_REQUEST['parentId']);			
			if($checkDupliTitle):
				echo json_encode(array("action"=>"warning","message"=>"category Title Already Exists."));		
				exit;		
			endif;

			// if(empty($_REQUEST['imageArrayname'])):				
			// 	echo json_encode(array("action"=>"warning","message"=>"Required Upload category Image!"));
			// 	exit;					
			// endif;
			
			$db->begin();
			if($category->save()): $db->commit();
			   $message  = sprintf($GLOBALS['basic']['addedSuccess_'], "category Image '".$category->title."'");
			echo json_encode(array("action"=>"success","message"=>$message));
				log_action("category [".$category->title."]".$GLOBALS['basic']['addedSuccess'],1,3);
			else: $db->rollback();
				echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
			endif;				
		break;
		
		case "edit":			
			$category = category::find_by_id($_REQUEST['idValue']);			
			
			$checkDupliTitle = category::checkDupliTitle($_REQUEST['title'],$category->parentId,$category->id);
			if($checkDupliTitle):
				echo json_encode(array("action"=>"warning","message"=>"category Title is already exist."));		
				exit;		
			endif;

			$category->slug 		            = create_slug($_REQUEST['title']);
			// $category->image		= !empty($_REQUEST['imageArrayname']) ? $_REQUEST['imageArrayname'] : '';					
			$category->title    = $_REQUEST['title'];	
			// $category->brief    = $_REQUEST['brief'];
			// $category->icon    	= !empty($_REQUEST['fa_icon'])?$_REQUEST['fa_icon']:'';	
			$category->status   = $_REQUEST['status'];	

			$db->begin();				
			if($category->save()):$db->commit();	
			   $message  = sprintf($GLOBALS['basic']['changesSaved_'], "category '".$category->title."'");
			   echo json_encode(array("action"=>"success","message"=>$message));
			   log_action("category [".$category->title."] Edit Successfully",1,4);
			else:$db->rollback();echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
			endif;							
		break;
								
		case "delete":
			$id = $_REQUEST['id'];
			$record = category::find_by_id($id);
			log_action("category  [".$record->title."]".$GLOBALS['basic']['deletedSuccess'],1,6);
			$db->begin();
			$db->query("DELETE FROM tbl_category WHERE parentId='{$id}'");
			$res = $db->query("DELETE FROM tbl_category WHERE id='{$id}'");
  		    if($res):$db->commit();	else: $db->rollback();endif;
			reOrder("tbl_category", "sortorder");						
			echo json_encode(array("action"=>"success","message"=>"category  [".$record->title."]".$GLOBALS['basic']['deletedSuccess']));							
		break;
		
		case "toggleStatus":
			$id = $_REQUEST['id'];
			$record = category::find_by_id($id);
			$record->status = ($record->status == 1) ? 0 : 1 ;
			$db->begin();						
				$res   =  $record->save();
				   if($res):$db->commit();	else: $db->rollback();endif;
			echo "";
		break;

		case "bulkToggleStatus":
			$id = $_REQUEST['idArray'];
			$allid = explode("|", $id);
			$return = "0";
			for($i=1; $i<count($allid); $i++){
				$record = category::find_by_id($allid[$i]);
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
						$db->query("DELETE FROM tbl_category WHERE parentId='".$allid[$i]."'");
				$res  = $db->query("DELETE FROM tbl_category WHERE id='".$allid[$i]."'");
				$return = 1;
			}
			if($res)$db->commit();else $db->rollback();
			reOrder("tbl_category", "sortorder");
			
			if($return==1):
			    $message  = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "category"); 
				echo json_encode(array("action"=>"success","message"=>$message));
			else:
				echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['noRecords']));
			endif;
		break;
				
		case "sort":
			$id 	 = $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
			$sortIds = $_REQUEST['sortIds'];
			$posId   = category::field_by_id($id,'parentId');
			datatableReordering('tbl_category', $sortIds, "sortorder", '', '',1);
			datatableReordering('tbl_category', $sortIds, "sortorder", "parentId",$posId);
			$message  = sprintf($GLOBALS['basic']['sorted_'], "category "); 
			echo json_encode(array("action"=>"success","message"=>$message));
		break;		
	}
?>