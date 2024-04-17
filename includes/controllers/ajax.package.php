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
		case "slug":
			$slug=$msg='';
			if(!empty($_REQUEST['title'])) {
				$nslug = create_slug($_REQUEST['title']);	
				$chk = check_slug($_REQUEST['actid'], $nslug);
				if($chk=='1') {					
					$msg="Slug already exists !";				
				}
				else {
					$slug = $nslug;					
				}				
			}
			echo json_encode(array('msgs'=>$msg, 'result'=>$slug));
			break;

		case "add":
			
			$Package = new Package();
			
			$Package->slug 			= $_REQUEST['slug'];
			$Package->title    		= $_REQUEST['title'];
//			$Package->sub_title    	= $_REQUEST['sub_title'];
			$Package->detail    	= $_REQUEST['detail'];	
			$Package->content   	= $_REQUEST['content'];
//			$Package->procedures   	= $_REQUEST['procedures'];
//			$Package->test_preparation   	= $_REQUEST['test_preparation'];

// 			$Package->title_greek    		= $_REQUEST['title_greek'];
// 			$Package->content_greek    	= $_REQUEST['content_greek'];	
// 			$Package->brief_greek    	= $_REQUEST['brief_greek'];	
//			$Package->sub_title_greek    = $_REQUEST['sub_title_greek'];
//			$Package->procedure_greek    	= $_REQUEST['procedure_greek'];
//			$Package->test_preparation_greek   = $_REQUEST['test_preparation_greek'];
			$Package->homepage 		= $_REQUEST['homepage'];	
			$Package->meta_title		= $_REQUEST['meta_title'];
			$Package->meta_keywords		= $_REQUEST['meta_keywords'];
			$Package->meta_description	= $_REQUEST['meta_description'];
		
// 			$Package->meta_title_greek	= $_REQUEST['meta_title_greek'];
// 			$Package->meta_keywords_greek = $_REQUEST['meta_keywords_greek'];
// 			$Package->meta_description_greek	= $_REQUEST['meta_description_greek'];
			
			$Package->image	        = (!empty($_REQUEST['imageArrayname']))?$_REQUEST['imageArrayname']:'';
			$Package->list_image	= (!empty($_REQUEST['imageArrayname3']))?$_REQUEST['imageArrayname3']:'';
			$Package->banner_image	= (!empty($_REQUEST['imageArrayname2']))?serialize(array_values(array_filter($_REQUEST['imageArrayname2']))):'a:0:{}';

			$Package->status		= $_REQUEST['status'];
			$Package->sortorder		= Package::find_maximum();
			$Package->added_date 	= registered();
			$Package->modified_date = registered();

			/*if(empty($_REQUEST['imageArrayname'])):
				echo json_encode(array("action"=>"warning","message"=>"Required Upload Image !"));
				exit;					
			endif;*/

			$checkDupliTitle = Package::checkDupliTitle($Package->title);			
			if($checkDupliTitle):
				echo json_encode(array("action"=>"warning","message"=>"Package Title Already Exists."));		
				exit;		
			endif;
			
			$db->begin();
			if($Package->save()):  $db->commit();
				// Global slug table storeSlug(class name, main slug, store id);
				$act_id = $db->insert_id();
				storeSlug('Package', $_REQUEST['slug'], $act_id);
				// End function
			   $message  = sprintf($GLOBALS['basic']['addedSuccess_'], "Package Image '".$Package->title."'");
			echo json_encode(array("action"=>"success","message"=>$message));
				log_action("Package [".$Package->title."]".$GLOBALS['basic']['addedSuccess'],1,3);
			else: $db->rollback();
				echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
			endif;				
		break;
		
		case "edit":			
			$Package = Package::find_by_id($_REQUEST['idValue']);
			
			if($Package->title!=$_REQUEST['title']){
				$checkDupliTitle = Package::checkDupliTitle($_REQUEST['title']);
				if($checkDupliTitle):
					echo json_encode(array("action"=>"warning","message"=>"Package Title is already exist."));		
					exit;		
				endif;
			}

			$Package->banner_image	= (!empty($_REQUEST['imageArrayname2']))?serialize(array_values(array_filter($_REQUEST['imageArrayname2']))):'a:0:{}';
			$Package->slug 	   = $_REQUEST['slug'];
			$Package->title    = $_REQUEST['title'];
//			$Package->sub_title = $_REQUEST['sub_title'];
			$Package->detail = $_REQUEST['detail'];	
			$Package->content  = $_REQUEST['content'];
//			$Package->procedures   	= $_REQUEST['procedures'];
//			$Package->test_preparation   	= $_REQUEST['test_preparation'];
// 			$Package->title_greek    		= $_REQUEST['title_greek'];
// 			$Package->content_greek    	= $_REQUEST['content_greek'];	
// 			$Package->brief_greek    	= $_REQUEST['brief_greek'];	
//			$Package->sub_title_greek    = $_REQUEST['sub_title_greek'];
//			$Package->procedure_greek    	= $_REQUEST['procedure_greek'];
//			$Package->test_preparation_greek   = $_REQUEST['test_preparation_greek'];
			$Package->status   = $_REQUEST['status'];	
			$Package->homepage 		= $_REQUEST['homepage'];
			$Package->meta_title		= $_REQUEST['meta_title'];
			$Package->meta_keywords		= $_REQUEST['meta_keywords'];
			$Package->meta_description	= $_REQUEST['meta_description'];

// 			$Package->meta_title_greek	= $_REQUEST['meta_title_greek'];
// 			$Package->meta_keywords_greek = $_REQUEST['meta_keywords_greek'];
// 			$Package->meta_description_greek	= $_REQUEST['meta_description_greek'];
			$Package->modified_date = registered();
			
			if(!empty($_REQUEST['imageArrayname3'])):
				$Package->list_image	= $_REQUEST['imageArrayname3'];
			endif;
			if(!empty($_REQUEST['imageArrayname'])):				
				$Package->image		= $_REQUEST['imageArrayname'];		
			endif;	

			$db->begin();				
			if($Package->save()):$db->commit();	
				// Global slug table storeSlug(class name, main slug, store id);
				$act_id = $_REQUEST['idValue'];
				storeSlug('Package', $_REQUEST['slug'], $act_id);
				// End function
			   $message  = sprintf($GLOBALS['basic']['changesSaved_'], "Package '".$Package->title."'");
			   echo json_encode(array("action"=>"success","message"=>$message));
			   log_action("Package ".$Package->title." Edit Successfully",1,4);
			else:$db->rollback();echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
			endif;							
		break;
								
		case "delete":
			$id = $_REQUEST['id'];
			$record = Package::find_by_id($id);
			// Global slug table deleteSlug(class name, store id);
			deleteSlug('Package', $id);
			// End function
			log_action("Package [".$record->title."]".$GLOBALS['basic']['deletedSuccess'],1,6);
			$db->begin();
			$res = $db->query("DELETE FROM tbl_package WHERE id='{$id}'");
            if ($res):
                $subpkgids = $db->fetch_array($db->query("SELECT id from tbl_package_sub WHERE type='{$id}'"));
                if(!empty($subpkgids)){
                    foreach ($subpkgids as $k => $v){
                        $db->query("DELETE FROM tbl_mlink WHERE act_id='".$v."' AND mod_class='Subpackage'");
                    }
                }
                $db->query("DELETE FROM tbl_package_sub WHERE type='{$id}'");
                $db->commit();
            else: $db->rollback();endif;
			reOrder("tbl_package", "sortorder");
            reOrder("tbl_package_sub", "sortorder");
            echo json_encode(array("action"=>"success","message"=>"Package  [".$record->title."]".$GLOBALS['basic']['deletedSuccess']));
		break;
		
		case "toggleStatus":
			$id = $_REQUEST['id'];
			$record = Package::find_by_id($id);
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
				$record = Package::find_by_id($allid[$i]);
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
            for ($i = 1; $i < count($allid); $i++) {
                $subpkgids = $db->fetch_array($db->query("SELECT id from tbl_package_sub WHERE type='{$allid[$i]}'"));
                if (!empty($subpkgids) and is_array($subpkgids)) {
                    foreach ($subpkgids as $k => $v) {
                        $db->query("DELETE FROM tbl_mlink WHERE act_id='" . $v . "' AND mod_class='Subpackage'");
                    }
                }
                $db->query("DELETE FROM tbl_package_sub WHERE type='" . $allid[$i] . "'");
                $db->query("DELETE FROM tbl_mlink WHERE act_id='" . $allid[$i] . "' AND mod_class='Package'");
                $res = $db->query("DELETE FROM tbl_package WHERE id='" . $allid[$i] . "'");
                $return = 1;
            }
			if($res)$db->commit();else $db->rollback();
			reOrder("tbl_package", "sortorder");
            reOrder("tbl_package_sub", "sortorder");
            if($return==1):
			    $message  = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "Package"); 
				echo json_encode(array("action"=>"success","message"=>$message));
			else:
				echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['noRecords']));
			endif;
		break;
				
		case "sort":
			$id 	 = $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
			$sortIds = $_REQUEST['sortIds'];
			datatableReordering('tbl_package', $sortIds, "sortorder", '', '',1);
			$message  = sprintf($GLOBALS['basic']['sorted_'], "Package "); 
			echo json_encode(array("action"=>"success","message"=>$message));
		break;				


		/*********************** Sub Package Transaction Section *************************/
		case "addSubpackage":
			$record	= new Subpackage();

			$record->type 			= $_REQUEST['type'];
//			$record->slug 			= $_REQUEST['slug'];
			$record->slug 			= create_slug($_REQUEST['title']);
			$record->title 			= $_REQUEST['title'];
            $record->title_greek        = (!empty($_REQUEST['title_greek'])) ? $_REQUEST['title_greek'] : '';
            $record->sub_title          = (!empty($_REQUEST['sub_title'])) ? $_REQUEST['sub_title'] : '';
            $record->sub_title_greek    = (!empty($_REQUEST['sub_title_greek'])) ? $_REQUEST['sub_title_greek'] : '';
			$record->brief 		        = !empty($_REQUEST['brief'])?$_REQUEST['brief']:'';
			$record->brief_greek        = !empty($_REQUEST['brief_greek'])?$_REQUEST['brief_greek']:'';
			$record->banner_image	    = !empty($_REQUEST['imageArrayname2'])?$_REQUEST['imageArrayname2']:'';
			$record->image2	            = !empty($_REQUEST['imageArrayname3'])?$_REQUEST['imageArrayname3']:'';
			$record->image 			    = !empty($_REQUEST['imageArrayname'])? serialize(array_values(array_filter($_REQUEST['imageArrayname']))):'';
			$record->content 		    = $_REQUEST['content'];
// 			$record->content_greek 		= $_REQUEST['content_greek'];
			$record->status			    = $_REQUEST['status'];

			$record->meta_title		        = $_REQUEST['meta_title'];
			$record->meta_keywords		    = $_REQUEST['meta_keywords'];
			$record->meta_description	    = $_REQUEST['meta_description'];
            // $record->meta_title_greek		= $_REQUEST['meta_title_greek'];
            // $record->meta_keywords_greek	= $_REQUEST['meta_keywords_greek'];
            // $record->meta_description_greek	= $_REQUEST['meta_description_greek'];

			$record->sortorder		= Subpackage::find_maximum_byparent("sortorder",$_REQUEST['type']);														
			$record->added_date 	= registered();
			$record->modified_date  = registered();

			$db->begin();
			if($record->save()): $db->commit();
				// Global slug table storeSlug(class name, main slug, store id);
				$act_id = $db->insert_id();
//				storeSlug('Subpackage', $_REQUEST['slug'], $act_id);
				// End function
				$message  = sprintf($GLOBALS['basic']['addedSuccess_'], "Sub Package '".$record->title."'");
				echo json_encode(array("action"=>"success","message"=>$message));
				log_action($message,1,3);
			else: $db->rollback(); echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
			endif;								
		break;

		case "editSubpackage":

			$record = Subpackage::find_by_id($_REQUEST['idValue']);

            $record->type 			= $_REQUEST['type'];
//            $record->slug 			= $_REQUEST['slug'];
            $record->slug 			= create_slug($_REQUEST['title']);
            $record->title 			= $_REQUEST['title'];
            $record->title_greek        = (!empty($_REQUEST['title_greek'])) ? $_REQUEST['title_greek'] : '';
            $record->sub_title          = (!empty($_REQUEST['sub_title'])) ? $_REQUEST['sub_title'] : '';
            $record->sub_title_greek    = (!empty($_REQUEST['sub_title_greek'])) ? $_REQUEST['sub_title_greek'] : '';
            $record->brief 		        = !empty($_REQUEST['brief'])?$_REQUEST['brief']:'';
            $record->brief_greek        = !empty($_REQUEST['brief_greek'])?$_REQUEST['brief_greek']:'';
            $record->banner_image	    = !empty($_REQUEST['imageArrayname2'])?$_REQUEST['imageArrayname2']:'';
            $record->image2     	    = !empty($_REQUEST['imageArrayname3'])?$_REQUEST['imageArrayname3']:'';
            $record->image 			    = !empty($_REQUEST['imageArrayname'])? serialize(array_values(array_filter($_REQUEST['imageArrayname']))):'';
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

			if($record->save()): $db->commit();
				// Global slug table storeSlug(class name, main slug, store id);
				$act_id = $_REQUEST['idValue'];
//				storeSlug('Subpackage', $_REQUEST['slug'], $act_id);
				// End function
			   $message  = sprintf($GLOBALS['basic']['changesSaved_'], "Sub Package '".$record->title."'");
			   echo json_encode(array("action"=>"success","message"=>$message));
			   log_action($message,1,4);
			else: $db->rollback();echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
			endif;	
		break;

		case "deletesubpackage":
			$id = $_REQUEST['id'];
			$record = Subpackage::find_by_id($id);
			// Global slug table deleteSlug(class name, store id);
            deleteSlug('Subpackage', $id);
            // End function
			log_action("Sub Package [".$record->title."]".$GLOBALS['basic']['deletedSuccess'],1,6);
			$db->begin();

            $res = $db->query("DELETE FROM tbl_package_sub WHERE id='{$id}'");
            $res = $db->query("DELETE FROM tbl_package_sub_sub WHERE subpackage_id='{$id}'");
            if ($res):
                $db->commit();
            else: $db->rollback();endif;
			reOrder("tbl_package_sub", "sortorder");
			echo json_encode(array("action"=>"success","message"=>"Sub Package [".$record->title."]".$GLOBALS['basic']['deletedSuccess']));
		break;

		case "SubtoggleStatus":
			$id = $_REQUEST['id'];
			$record = Subpackage::find_by_id($id);
			$record->status = ($record->status == 1) ? 0 : 1 ;
			$db->begin();						
				$res   =  $record->save();
				if($res):$db->commit();	else: $db->rollback();endif;
			echo "";
		break;

		case "subbulkToggleStatus":
			$id = $_REQUEST['idArray'];
			$allid = explode("|", $id);
			$return = "0";
			for($i=1; $i<count($allid); $i++){
				$record = Subpackage::find_by_id($allid[$i]);
				$record->status = ($record->status == 1) ? 0 : 1 ;
				$record->save();
			}
			echo "";
		break;
			
		case "subbulkDelete":
			$id = $_REQUEST['idArray'];
			$allid = explode("|", $id);
			$return = "0";
			$db->begin();
			for($i=1; $i<count($allid); $i++){
				$record = Subpackage::find_by_id($allid[$i]);
				$res  = $db->query("DELETE FROM tbl_package_sub WHERE id='".$allid[$i]."'");	
				$db->query("DELETE FROM tbl_mlink WHERE act_id='".$allid[$i]."' AND mod_class='Subpackage'");
				$db->query("DELETE FROM tbl_package_sub_sub WHERE subpackage_id='".$allid[$i]."'");
				reOrderSub("tbl_package_sub", "sortorder", "type",$record->type);
				$return = 1;
			}
			if($res)$db->commit();else $db->rollback();

			if($return==1):
			    $message  = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "Package"); 
				echo json_encode(array("action"=>"success","message"=>$message));
			else:
				echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['noRecords']));
			endif;
		break;

		case "subSort":
			$id 	 = $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
			$sortIds = $_REQUEST['sortIds'];
			$posId   = Subpackage::field_by_id($id,'type');
			datatableReordering('tbl_package_sub', $sortIds, "sortorder", "type",$posId,1);
			$message  = sprintf($GLOBALS['basic']['sorted_'], "Sub Package"); 
			echo json_encode(array("action"=>"success","message"=>$message));
		break;	

		case "SubitoggleStatus":
			$id = $_REQUEST['id'];
			$record = SubPackageImage::find_by_id($id);
			$record->status = ($record->status == 1) ? 0 : 1 ;
			$db->begin();						
				$res   =  $record->save();
				if($res):$db->commit();	else: $db->rollback();endif;
			echo "";
		break;


		case "getRoomsdetails":
			$result='';
			$getdate = addslashes($_REQUEST['getdate']);
			$roomCat  = Subpackage::getPackage_limit(1);
	    	if($roomCat):
	    		foreach($roomCat as $roomRow){ 
	    			$rec = Subpackage::find_by_id($roomRow->id); 
	    			$nos = json_decode($rec->image, true);
	    			global $db;
	    			$sql = "SELECT ss.season,ss.date_from, ss.date_to, rp.one_person, rp.two_person, rp.three_person
	    					FROM 
	    					tbl_seasion AS ss
	    					INNER JOIN tbl_room_price AS rp
	    					ON ss.id = rp.season_id
	    					WHERE ss.date_to>='$getdate' LIMIT 1";
	    			$dtResult = $db->query($sql);

	    			$sql2 = "SELECT rp.one_person, rp.two_person, rp.three_person
	    			 		FROM 
	    			 		tbl_room_price AS rp
	    			 		WHERE rp.season_id='0' AND rp.room_id= $rec->id LIMIT 1";
	    			$dfltResult = $db->query($sql2);
	    				
	    			$myArr='';
	    			if($db->num_rows($dtResult)>0){
	    				$myArr = $dtResult;
	    			}else{
	    				$myArr = $dfltResult;
	    			}

	    			$romprice = array();
	    			while ($row = $db->fetch_array($myArr)) {
	    				foreach($row as $key=>$val){$$key=$val;}
	    				$romprice = array(1=>$one_person,2=>$two_person,3=>$three_person);
	    			}
	    	  $result.='<div class="main_imgdiv">
	    					<img alt="'.$rec->title.'" src="'.IMAGE_PATH.'subpackage/'.$nos[0].'">
	    				</div>
	    				<div class="main_listing">';
	    				for($i=1; $i<=$rec->people_qnty; $i++){ 
					$result.='<ul>
							 	<li>'.$i.'</li>
							 	<li>'.$rec->currency.' '.$romprice[$i].'</li>
							 	<li>
								 	<select name="" id="" class="select-room" data-person="'.$i.'" data-currency="'.$rec->currency.'" data-price="'.$romprice[$i].'"
                                    data-room="'.$rec->title.'">
								 		<option value="0">0</option>';
				    					 for($j=1; $j<=$rec->no_rooms; $j++){
				    						$result.='<option value="'.$j.'">'.$j.'</option>';
				    					} 
						  $result.='</select>
							 	</li>
							 	<li><span class="ind-total">0</span></li>
							</ul>
							<div class="clear"></div>';
						 } 								
				$result.='</div>
						<div class="clear"></div>';
    	  		 } 
			endif;

			echo json_encode(array("roomresult"=>$result));
		break;

        /*********************** Sub Sub Package Transaction Section *************************/
        case "addSubsubpackage":
            $record	= new Subsubpackage();

            $record->subpackage_id  = $_REQUEST['subpackage_id'];
            $record->slug 			= $_REQUEST['slug'];
            $record->title 			= $_REQUEST['title'];
            $record->title_greek    = (!empty($_REQUEST['title_greek'])) ? $_REQUEST['title_greek'] : '';
            $record->content 		    = $_REQUEST['content'];
            // $record->content_greek 		= $_REQUEST['content_greek'];
            $record->status			    = $_REQUEST['status'];

            $record->sortorder		= Subsubpackage::find_maximum_byparent("sortorder",$_REQUEST['subpackage_id']);
            $record->added_date 	= registered();
            $record->modified_date  = registered();

            $db->begin();
            if($record->save()): $db->commit();
                $message  = sprintf($GLOBALS['basic']['addedSuccess_'], "Sub Sub Package '".$record->title."'");
                echo json_encode(array("action"=>"success","message"=>$message));
                log_action($message,1,3);
            else: $db->rollback(); echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
            endif;
        break;

        case "editSubsubpackage":

            $record = Subsubpackage::find_by_id($_REQUEST['idValue']);

            $record->subpackage_id 	= $_REQUEST['subpackage_id'];
            $record->slug 			= $_REQUEST['slug'];
            $record->title 			= $_REQUEST['title'];
            $record->title_greek    = (!empty($_REQUEST['title_greek'])) ? $_REQUEST['title_greek'] : '';
            $record->content 		    = $_REQUEST['content'];
            // $record->content_greek 		= $_REQUEST['content_greek'];
            $record->status			    = $_REQUEST['status'];

            $record->modified_date      = registered();

            $db->begin();

            if($record->save()): $db->commit();
                $message  = sprintf($GLOBALS['basic']['changesSaved_'], "Sub Sub Package '".$record->title."'");
                echo json_encode(array("action"=>"success","message"=>$message));
                log_action($message,1,4);
            else: $db->rollback();echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
            endif;
        break;

        case "deletesubsubpackage":
            $id = $_REQUEST['id'];
            $record = Subsubpackage::find_by_id($id);
            log_action("Sub Sub Package [".$record->title."]".$GLOBALS['basic']['deletedSuccess'],1,6);
            $db->begin();

            $res = $db->query("DELETE FROM tbl_package_sub_sub WHERE id='{$id}'");
            if ($res):
                $db->commit();
            else: $db->rollback();endif;
            reOrder("tbl_package_sub_sub", "sortorder");
            echo json_encode(array("action"=>"success","message"=>"Sub Sub Package [".$record->title."], ".$GLOBALS['basic']['deletedSuccess']));
        break;

        case "SubsubtoggleStatus":
            $id = $_REQUEST['id'];
            $record = Subsubpackage::find_by_id($id);
            $record->status = ($record->status == 1) ? 0 : 1 ;
            $db->begin();
            $res   =  $record->save();
            if($res):$db->commit();	else: $db->rollback();endif;
            echo "";
        break;

        case "subsubbulkToggleStatus":
            $id = $_REQUEST['idArray'];
            $allid = explode("|", $id);
            $return = "0";
            for($i=1; $i<count($allid); $i++){
                $record = Subsubpackage::find_by_id($allid[$i]);
                $record->status = ($record->status == 1) ? 0 : 1 ;
                $record->save();
            }
            echo "";
        break;

        case "subsubbulkDelete":
            $id = $_REQUEST['idArray'];
            $allid = explode("|", $id);
            $return = "0";
            $db->begin();
            for($i=1; $i<count($allid); $i++){
                $record = Subsubpackage::find_by_id($allid[$i]);
                $res  = $db->query("DELETE FROM tbl_package_sub_sub WHERE id='".$allid[$i]."'");
                reOrderSub("tbl_package_sub_sub", "sortorder", "subpackage_id", $record->subpackage_id);
                $return = 1;
            }
            if($res)$db->commit();else $db->rollback();

            if($return==1):
                $message  = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "Sub Sub Package");
                echo json_encode(array("action"=>"success","message"=>$message));
            else:
                echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['noRecords']));
            endif;
        break;

        case "subsubSort":
            $id 	 = $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
            $sortIds = $_REQUEST['sortIds'];
            $posId   = Subsubpackage::field_by_id($id,'subpackage_id');
            datatableReordering('tbl_package_sub_sub', $sortIds, "sortorder", "subpackage_id", $posId,1);
            $message  = sprintf($GLOBALS['basic']['sorted_'], "Sub Sub Package");
            echo json_encode(array("action"=>"success","message"=>$message));
        break;
    }
?>