<?php

define('LOGOUT_PAGE', 1); // Track homepage.
define('JCMSTYPE', 0); // Track Current site language.

require_once("includes/initialize.php");

$userId = $session->get("user_id");

$session->clear('user_id');
$session->clear('email_logged');

// getting products from cart
$productsArr = [];
$sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
if (!empty($sesRec)) {
    foreach ($sesRec as $k => $sesRow) {
        $productsArr[] = $sesRow['slug'];
    }
}

//saving items from cart into wishlist
$sql = "SELECT * FROM tbl_wishlist WHERE user_id={$userId} LIMIT 1";
$wishlist = WishList::find_by_sql($sql);
if (!empty($wishlist)) {
    $wishlistObj = $wishlist[0];
    $oldList = unserialize($wishlistObj->data);

    // Find unique values in $productsArr that are not in $oldList
    $uniqueValues = array_diff($productsArr, $oldList);

    // Merge these unique values into $oldList
    $oldList = array_merge($oldList, $uniqueValues);

    $wishlistObj->data = serialize($oldList);
    $wishlistObj->modified_date = registered();
    $db->begin();
    if ($wishlistObj->save()) {
        $db->commit();
    }
}
else {
    $record = new WishList();
    $record->user_id = $payRecord->user_id;
    $record->data = serialize($productsArr);
    $record->added_date = registered();
    $record->modified_date = registered();
    $db->begin();
    if ($record->save()) {
        $db->commit();
    }
}

$session->clear('cart_detail');

redirect_to(BASE_URL . 'login');