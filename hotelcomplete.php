<?php
require_once("includes/initialize.php");

// $term = addslashes($_REQUEST['term']);
// $sql = "SELECT ht.code, ht.title, ht.street, ht.city, ht.zone, ht.district FROM tbl_apihotel AS ht WHERE ht.status='1' AND ( 
// 		ht.title like '%".$term."%' 
// 	   	OR ht.street like '%".$term."%' 
// 	   	OR ht.city like '%".$term."%' 
// 	   	OR ht.zone like '%".$term."%'
// 	   	OR ht.district like '%".$term."%') ORDER BY id DESC ";
// $query = $db->query($sql);
// $totRec = $db->num_rows($query);

// $newArr = array();
// if($totRec>0) {
// 	while($row=$db->fetch_object($query)) {
// 		$fulladdress = $row->title.', '.$row->street.', '.$row->city.', '.$row->zone.', '.$row->district;
// 		$newArr[] = array('value'=> $fulladdress, 'id'=>$row->code);
// 	}
// }

// echo json_encode($newArr);

if(!empty($_REQUEST['term'])) {
    $term = addslashes($_REQUEST['term']);
    /*
    $sql = "SELECT ht.code, ht.title, ht.street, ht.city, ht.zone, ht.district, ht.country FROM tbl_apihotel AS ht WHERE ht.status='1' AND (
        CONVERT(ht.street USING utf8) like '%".$term."%'
        OR CONVERT(ht.zone USING utf8) like '%".$term."%'
           OR CONVERT(ht.district USING utf8) like '%".$term."%'
           OR CONVERT(ht.country USING utf8) like '%".$term."%' ) GROUP BY ht.district ORDER BY id DESC ";
    $query = $db->query($sql);
    $totRec = $db->num_rows($query);
    $newArr = array();
    if($totRec>0) {
        while($row=$db->fetch_object($query)) {
            $address = $row->zone.', '.$row->district;
            $newArr[] = array('value'=> $address, 'id'=>$row->district);
        }
    }

    $sql2 = "SELECT ht.code, ht.title, ht.street, ht.city, ht.zone, ht.district FROM tbl_apihotel AS ht WHERE ht.status='1' AND (
        ht.title like '%".$term."%'
           OR ht.street like '%".$term."%'
           OR ht.city like '%".$term."%'
           OR ht.zone like '%".$term."%'
           OR ht.district like '%".$term."%') ORDER BY id DESC ";
    $query2 = $db->query($sql2);
    $totRec2 = $db->num_rows($query2);
    if($totRec2>0) {
        while($row=$db->fetch_object($query2)) {
            $hotel = $row->title.', '.$row->street.', '.$row->city.', '.$row->zone.', '.$row->district;
            $newArr[] = array('value'=> $hotel, 'id'=>$row->code);
        }
    }
    */

    $newArrc = array();
    $sql = "
            SELECT id, title FROM tbl_category
            WHERE status='1' AND (
				title like '%".$term."%'
            )
            ORDER BY title ASC
            ";
    $query = $db->query($sql);
    $totRec = $db->num_rows($query);
    if ($totRec > 0) {
        while ($row = $db->fetch_object($query)) {
            $address = $row->title;
			$link = '#';
			// $categoryid=  $row->id;
            $newArrc[] = array('value' => $address, 'link' =>$link, 'id' => $row->id);
        }
    }

    $sql2 = "
            SELECT id, slug, title, Category , Subcategory, brand, type FROM tbl_product_sub 
            WHERE status='1' AND (
              title like '%" . $term . "%' 
            ) 
            ORDER BY title ASC
            ";
    $query2 = $db->query($sql2);
    $totRec2 = $db->num_rows($query2);
    if ($totRec2 > 0) {
        while ($row = $db->fetch_object($query2)) {
//            $hotel = $row->pkg_title . ', ' . $row->dest_title . ', ' . $row->region_title;
            $hotel = $row->title ;
            $link = $row->slug;
            $newArrc[] = array('value' => $hotel,'link' => $link, 'id' => $row->id);
        }
    }

     echo  json_encode($newArrc);
    //  echo  json_encode($newArrc);
}

if(!empty($_POST['action']) and ($_POST['action']=='getlink')) {
    foreach($_POST as $key=>$val) { $$key = $val;}
    $data = serialize(array(
        'searchkey'=>$searchkey )
    );
    echo json_encode(array('url'=>strtr(base64_encode($data), '+/', '-_')));
}

if(!empty($_POST['action']) and ($_POST['action']=='getlinktour')) {
    foreach($_POST as $key=>$val) { $$key = $val;}
    $data = serialize(array(
        'destination' => $destination,
        'activity' => $activity,
        'duration' => $duration));
    echo json_encode(array('url'=>strtr(base64_encode($data), '+/', '-_')));
}

if(!empty($_POST['action']) and ($_POST['action']=='getsearch')) {
    foreach($_POST as $key=>$val) { $$key = $val;}
    $rating = (!empty($rating))?$rating:'';
    $data = serialize(array('destination_id'=>$destination_id, 'price_range'=>$price_range, 'checkin'=>$checkin, 'checkout'=>$checkout, 'adults'=>$adults , 'child'=>$child , 'rating'=>$rating ));
    echo json_encode(array('url'=>strtr(base64_encode($data), '+/', '-_')));
}

if(!empty($_POST['action']) and ($_POST['action']=='getlinkapi')) {
    foreach($_POST as $key=>$val) { $$key = $val;}
    $data = serialize(array(
        'apiKey' => $apiKey,
        'searchkey' => $searchkey,
        'packageId' => $packageId,
        'checkin' => $checkin,
        'checkout' => $checkout,
        'adults' => $adults,
        'child' => $child));
    echo json_encode(array('url'=>strtr(base64_encode($data), '+/', '-_')));
}

if(!empty($_POST['action']) and ($_POST['action']=='getlinktourapi')) {
    foreach($_POST as $key=>$val) { $$key = $val;}
    $data = serialize(array(
        'apiKey' => $apiKey,
        'destination' => $destination,
        'activity' => $activity,
        'duration' => $duration));
    echo json_encode(array('url'=>strtr(base64_encode($data), '+/', '-_')));
}