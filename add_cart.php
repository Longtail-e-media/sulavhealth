<?php

require_once("includes/initialize.php");

$lang = !empty($session->get('lang_type')) ? $session->get('lang_type') : 'g';

$slug = !empty($_POST['item_slug']) ? addslashes($_POST['item_slug']) : '';
$prqty = !empty($_POST['item_qty']) ? addslashes($_POST['item_qty']) : '';

//unset($_SESSION['cart_detail']);

switch ($_POST['action']) {
    case 'add_cart':

        foreach ($_POST as $key => $val) {
            $$key = $val;
        }

        $pkgRow = Subproduct::find_by_slug($slug);
        $total = 0;
        $message = '';

        if (!empty($pkgRow)) {
            if (isset($_SESSION['cart_detail'])) {
                // check if product already in cart
                if (array_key_exists($pkgRow->id, $_SESSION['cart_detail'])) {
                    // check if product has multiple checkboxes
                    if (is_array($product_check) and !empty($product_check)) {
                        $lengthArr = sizeof($product_check);
                        // check for each checkbox
                        for ($i = 0; $i < $lengthArr; $i++) {
                            $label = 'product_qnt_' . $product_check[$i];
                            $label_value = $$label;
                            // check if label already added
                            if (array_key_exists($label_value, $_SESSION['cart_detail'][$pkgRow->id]['product_details'])) {
                                $netqnt = 'product_net_qnt_' . $product_check[$i];
                                $net_qnt = $$netqnt;
                                $price = 'product_price_' . $product_check[$i];
                                $price_value = $$price;
                                $quantity = 'product_qty_' . $product_check[$i];
                                $quantity_value = $$quantity;
                                $qnt = $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value]['quantity'];
                                $qnt = $qnt + $quantity_value;
                                $newTotal = (float)$qnt * (float)$price_value;
                                $newTotal = sprintf("%.2f", $newTotal);
                                $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value]['netqnt'] = $net_qnt;
                                $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value]['price'] = $price_value;
                                $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value]['quantity'] = $qnt;
                                $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value]['total'] = $newTotal;
                            } else {
                                $netqnt = 'product_net_qnt_' . $product_check[$i];
                                $price = 'product_price_' . $product_check[$i];
                                $quantity = 'product_qty_' . $product_check[$i];
                                // check if quantity is 0
                                $checkquantity = ($$quantity > 0) ? $$quantity : 1;
                                $total = 'product_total_' . $product_check[$i];
                                $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value] =
                                    array(
                                        'netqnt' => $$netqnt,
                                        'price' => $$price,
                                        'quantity' => $checkquantity,
                                        'total' => $$total
                                    );
                            }
                        }
                    }
                } else {
                    // check if product has multiple checkboxes
                    if (is_array($product_check) and !empty($product_check)) {
                        $pDetails = array();
                        $lengthArr = sizeof($product_check);
                        for ($i = 0; $i < $lengthArr; $i++) {
                            $label = 'product_qnt_' . $product_check[$i];
                            $netqnt = 'product_net_qnt_' . $product_check[$i];
                            $price = 'product_price_' . $product_check[$i];
                            $quantity = 'product_qty_' . $product_check[$i];
                            $checkquantity = ($$quantity > 0) ? $$quantity : 1;
                            $total = 'product_total_' . $product_check[$i];
                            $pDetails[$$label] = array('netqnt' => $$netqnt, 'price' => $$price, 'quantity' => $checkquantity, 'total' => $$total);
                        }
                        $_SESSION['cart_detail'][$pkgRow->id] =
                            array(
                                'slug' => $pkgRow->slug,
                                'product_details' => $pDetails
                            );
                    }
                }
            } else {
                if (is_array($product_check) and !empty($product_check)) {
                    $pDetails = array();
                    $lengthArr = sizeof($product_check);
                    for ($i = 0; $i < $lengthArr; $i++) {
                        $label = 'product_qnt_' . $product_check[$i];
                        $netqnt = 'product_net_qnt_' . $product_check[$i];
                        $price = 'product_price_' . $product_check[$i];
                        $quantity = 'product_qty_' . $product_check[$i];
                        $checkquantity = ($$quantity > 0) ? $$quantity : 1;
                        $total = 'product_total_' . $product_check[$i];
                        $pDetails[$$label] = array('netqnt' => $$netqnt, 'price' => $$price, 'quantity' => $checkquantity, 'total' => $$total);
                    }
                    $_SESSION['cart_detail'][$pkgRow->id] =
                        array(
                            'slug' => $pkgRow->slug,
                            'product_details' => $pDetails
                        );
                }
            }
            $message = $pkgRow->title . ' product added !';
            $total = count($_SESSION['cart_detail']);

            $images = SubProductImage::getImagelist_by($pkgRow->id, 1, 0);
            $img = BASE_URL . 'template/web/img/product/one.jpg';
            if (!empty($images)) {
                foreach ($images as $image) {
                    $file_path = SITE_ROOT . 'images/product/galleryimages/' . $image->image;
                    if (file_exists($file_path)) {
                        $img = IMAGE_PATH . 'product/galleryimages/' . $image->image;
                    }
                }
            }
            $content = '
                <div class="modal-product-img">
                    <img src="' . $img . '" alt="' . $pkgRow->title . '">
                </div>
                <div class="modal-product-info">
                    <h5>' . $pkgRow->title . '</h5>
                    <p class="added-cart"><i class="fa fa-check-circle"></i> ' . 'Successfully added to your Cart' . '</p>
                    <div class="btn-wrapper">
                        <a href="' . BASE_URL . 'cart" class="theme-btn-1 btn btn-effect-1">' . 'View Cart' . '</a>
                        <a href="' . BASE_URL . 'checkout" class="theme-btn-2 btn btn-effect-2">' . 'Checkout' . '</a>
                    </div>
                </div>
            ';
        }

        echo json_encode(array('result' => $message, 'no_cart' => $total, 'content' => $content));

        break;

    case 'list_cart':

        $res = '';
        $default = '';
        $tot = 0.00;
        $total = 'NPR 0.00';
        $sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
        $totaldiv = '';

        if (!empty($sesRec)) {
            foreach ($sesRec as $k => $sesRow) {
                $product = SubProduct::find_by_slug($sesRow['slug']);
                if (!empty($product)) {
                    $images = SubProductImage::getImagelist_by($product->id, 1, 0);
                    $img = BASE_URL . 'template/web/img/product/one.jpg';
                    if (!empty($images)) {
                        foreach ($images as $image) {
                            $file_path = SITE_ROOT . 'images/product/galleryimages/' . $image->image;
                            if (file_exists($file_path)) {
                                $img = IMAGE_PATH . 'product/galleryimages/' . $image->image;
                            }
                        }
                    }
                    $res .= '
                        <div class="mini-cart-item clearfix cart-remove">
                            <div class="mini-cart-img">
                                <img src="' . $img . '" alt="' . $product->title . '">
                                <span class="mini-cart-item-delete remove-cart" data-id="' . $product->id . '"><i class="icon-cancel"></i></span>
                            </div>
                            <div class="mini-cart-info">
                                <h6><a href="' . BASE_URL . 'product/' . $product->slug . '">' . $product->title . '</a></h6>
                    ';
                    $product_details = $sesRow['product_details'];
                    foreach ($product_details as $label => $detail) {
                        $res .= '<span class="mini-cart-quantity">' . $detail['netqnt'] . ' ' . $detail['quantity'] . ' x ' . $product->currency . ' ' . sprintf("%.2f", $detail['price']) . '</span><br>';
                        $tot = (float)$tot + ((float)$detail['quantity'] * (float)$detail['price']);
                        $tot = sprintf("%.2f", $tot);
                    }
                    $total = $product->currency . ' ' . $tot;
                    $res .= '
                            </div>
                        </div>
                    ';


                }
               
            }
        } else {
            $default = '<p>You have no order images. Would you like to try from homepage?</p>
                    <a href="dhome" class="theme-btn-2 btn btn-effect-2" title="Homepage"> 
                    &#8592;  &nbsp; Go Home
                    </a>';
            $res .= '
                <div class="mini-cart-item clearfix">
                    <h6>Select your products and add to your shopping cart !</h6>
                </div>
			';
        }


        if ($tot > 0) {
            $totaldiv = '
            <div class="mini-cart-sub-total">
            <h5>Subtotal: <span class="sub-total-mini-cart">' . $total . '</span></h5>
        </div>
        <div class="btn-wrapper">
            <a href="' . BASE_URL . 'cart" class="theme-btn-1 btn btn-effect-1">View Cart</a>
            <a href="' . BASE_URL . 'checkout" class="theme-btn-2 btn btn-effect-2">Checkout</a>
        </div>';
        } else {
            $default = '<p>You have no order images. Would you like to try from homepage?</p>
                    <a href="dhome" class="theme-btn-2 btn btn-effect-2" title="Homepage"> 
                    &#8592;  &nbsp; Go Home
                    </a>';
            
            $totaldiv = '               
                <div class="mini-cart-item clearfix">
                    <h6>No Items in Cart</h6>
                </div>';

        }
        echo json_encode(array('result' => $res, 'defaultmsg'=>$default, 'sub_total' => $totaldiv));

        break;

    case 'remove_cart':

        $message = '';
        $total = count($_SESSION['cart_detail']);
        $totaldiv = '';

        $item_id = !empty($_POST['item_id']) ? addslashes($_POST['item_id']) : '';
        if (!empty($item_id)) {
            unset($_SESSION['cart_detail'][$item_id]);
            $total = count($_SESSION['cart_detail']);
            $message = 'Product removed !';
        }

        $sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
        $tot = 0.00;
        $sub_total = 'NPR 0.00';

        if (!empty($sesRec)) {
            foreach ($sesRec as $k => $sesRow) {
                $product = SubProduct::find_by_slug($sesRow['slug']);
                if (!empty($product)) {
                    $product_details = $sesRow['product_details'];
                    foreach ($product_details as $label => $detail) {
                        $tot = (float)$tot + ((float)$detail['quantity'] * (float)$detail['price']);
                        $tot = sprintf("%.2f", $tot);
                    }
                    $sub_total = $product->currency . ' ' . $tot;
                }
            }
        }

        if ($tot > 0) {
            $totaldiv = '
            <div class="mini-cart-sub-total">
                <h5>Subtotal: <span class="sub-total-mini-cart">' . $sub_total . '</span></h5>
            </div>
            <div class="btn-wrapper">
                <a href="' . BASE_URL . 'cart" class="theme-btn-1 btn btn-effect-1">View Cart</a>
                <a href="' . BASE_URL . 'checkout" class="theme-btn-2 btn btn-effect-2">Checkout</a>
            </div>';
        } else {
            $totaldiv = '               
            <div class="mini-cart-item clearfix">
                <h6>No Items in Cart</h6>
            </div>';
        }

        echo json_encode(array('result' => $message, 'no_cart' => $total, 'sub_total' => $totaldiv));

        break;

    case 'update_cart':
        $message = '';
        $item_id = !empty($_POST['item_id']) ? addslashes($_POST['item_id']) : '';
        $item_label = !empty($_POST['item_label']) ? addslashes($_POST['item_label']) : '';
        $item_price = !empty($_POST['item_price']) ? addslashes($_POST['item_price']) : '';
        $item_qty = !empty($_POST['item_qty']) ? addslashes($_POST['item_qty']) : '1';
        if (!empty($item_id) and !empty($item_label)) {
            $pkgRow = SubProduct::find_by_id($item_id);
            if (!empty($pkgRow)) {
                $newTotal = (float)$item_qty * (float)$item_price;
                $newTotal = sprintf("%.2f", $newTotal);
                $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$item_label]['price'] = $item_price;
                $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$item_label]['quantity'] = $item_qty;
                $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$item_label]['total'] = $newTotal;
            }
            $message = 'Product Updated !';
        }
        echo json_encode(array('result' => $message));
        break;

    case 'add_wishlist':

        foreach ($_POST as $key => $val) {
            $$key = $val;
        }

        $userId = $session->get("user_id");
        $check_login = (!empty($userId)) ? User::find_by_id($userId) : '';

        if ($check_login) {
            $sql = "SELECT * FROM tbl_wishlist WHERE user_id={$userId} LIMIT 1";
            $wishlist = WishList::find_by_sql($sql);
            if (!empty($wishlist)) {
                $wishlistObj = $wishlist[0];
                $oldList = unserialize($wishlistObj->data);
                if (in_array($product_slug[0], $oldList)) {
                    $message = 'Product is already in Wishlist!';
                    echo json_encode(array('action' => 'warning_already_in_wishlist', 'message' => $message));
                } else {
                    array_push($oldList, $product_slug[0]);
                    $wishlistObj->data = serialize($oldList);
                    $wishlistObj->modified_date = registered();
                    $db->begin();
                    if ($wishlistObj->save()) {
                        $db->commit();

                        $pkgRow = SubProduct::find_by_slug($product_slug[0]);
                        $images = SubProductImage::getImagelist_by($pkgRow->id, 1, 0);
                        $img = BASE_URL . 'template/web/img/product/one.jpg';
                        if (!empty($images)) {
                            foreach ($images as $image) {
                                $file_path = SITE_ROOT . 'images/product/galleryimages/' . $image->image;
                                if (file_exists($file_path)) {
                                    $img = IMAGE_PATH . 'product/galleryimages/' . $image->image;
                                }
                            }
                        }
                        $content = '
                            <div class="modal-product-img">
                                <img src="' . $img . '" alt="' . $pkgRow->title . '">
                            </div>
                            <div class="modal-product-info">
                                <h5>' . $pkgRow->title . '</h5>
                                <p class="added-cart"><i class="fa fa-check-circle"></i> ' . 'Successfully added to your Wishlist' . '</p>
                                <div class="btn-wrapper">
                                    <a href="' . BASE_URL . 'dashboard#wishlist" class="theme-btn-1 btn btn-effect-1">' . 'View Wishlist' . '</a>
                                </div>
                            </div>
                        ';

                        echo json_encode(array("action" => "success", "message" => "Added to Wishlist.", "content" => $content));
                    } else {
                        echo json_encode(array("action" => "unsuccess", "message" => "Cannot add to Wishlist at the moment. Please try again later."));
                    }
                }
            } else {
                $record = new WishList();
                $record->user_id = $userId;
                $record->data = serialize($product_slug);
                $record->added_date = registered();
                $record->modified_date = registered();
                $db->begin();
                if ($record->save()) {
                    $db->commit();

                    $pkgRow = SubProduct::find_by_slug($product_slug[0]);
                    $images = SubProductImage::getImagelist_by($pkgRow->id, 1, 0);
                    $img = BASE_URL . 'template/web/img/product/one.jpg';
                    if (!empty($images)) {
                        foreach ($images as $image) {
                            $file_path = SITE_ROOT . 'images/product/galleryimages/' . $image->image;
                            if (file_exists($file_path)) {
                                $img = IMAGE_PATH . 'product/galleryimages/' . $image->image;
                            }
                        }
                    }
                    $content = '
                        <div class="modal-product-img">
                            <img src="' . $img . '" alt="' . $pkgRow->title . '">
                        </div>
                        <div class="modal-product-info">
                            <h5>' . $pkgRow->title . '</h5>
                            <p class="added-cart"><i class="fa fa-check-circle"></i> ' . 'Successfully added to your Wishlist' . '</p>
                            <div class="btn-wrapper">
                                <a href="' . BASE_URL . 'dashboard#wishlist" class="theme-btn-1 btn btn-effect-1">' . 'View Wishlist' . '</a>
                            </div>
                        </div>
                    ';

                    echo json_encode(array("action" => "success", "message" => "Added to Wishlist.", "content" => $content));
                } else {
                    echo json_encode(array("action" => "unsuccess", "message" => "Cannot add to Wishlist at the moment. Please try again later."));
                }
            }
        } else {
            $message = 'Please log in before adding Product to Wishlist!';
            echo json_encode(array('action' => 'warning_no_login', 'message' => $message));
        }

        break;

    case 'add_cart_wishlist':

        foreach ($_POST as $key => $val) {
            $$key = $val;
        }

        $pkgRow = Subproduct::find_by_slug($item_slug);
        $total = 0;
        $message = '';
        $defaultadd ='';

        if (!empty($pkgRow)) {
            if (isset($_SESSION['cart_detail'])) {
                // check if product already in cart
                if (array_key_exists($pkgRow->id, $_SESSION['cart_detail'])) {
                    $label_value = $pkgRow->qnt1;
                    // check if label already added
                    if (array_key_exists($label_value, $_SESSION['cart_detail'][$pkgRow->id]['product_details'])) {
                        $netqnt = $pkgRow->netqnt1;
                        $price_value = $pkgRow->price1;
                        $quantity_value = 1;
                        $qnt = $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value]['quantity'];
                        $qnt = $qnt + $quantity_value;
                        $newTotal = (float)$qnt * (float)$price_value;
                        $newTotal = sprintf("%.2f", $newTotal);
                        $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value]['netqnt'] = $netqnt;
                        $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value]['price'] = $price_value;
                        $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value]['quantity'] = $qnt;
                        $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value]['total'] = $newTotal;
                    } else {
                        $price = $pkgRow->price1;
                        $netqnt = $pkgRow->netqnt1;
                        $quantity = 1;
                        $total = (float)$pkgRow->price1;
                        $_SESSION['cart_detail'][$pkgRow->id]['product_details'][$label_value] =
                            array(
                                'netqnt' => $netqnt,
                                'price' => $price,
                                'quantity' => $quantity,
                                'total' => $total
                            );
                    }
                } else {
                    $pDetails = array();
                    $label = $pkgRow->qnt1;
                    $netqnt = $pkgRow->netqnt1;
                    $price = $pkgRow->price1;
                    $quantity = 1;
                    $total = (float)$pkgRow->price1;
                    $pDetails[$label] = array('netqnt' => $netqnt, 'price' => $price, 'quantity' => $quantity, 'total' => $total);
                    $_SESSION['cart_detail'][$pkgRow->id] =
                        array(
                            'slug' => $pkgRow->slug,
                            'product_details' => $pDetails
                        );
                }
            } else {
                $pDetails = array();
                $label = $pkgRow->qnt1;
                $netqnt = $pkgRow->netqnt1;
                $price = $pkgRow->price1;
                $quantity = 1;
                $total = (float)$pkgRow->price1;
                $pDetails[$label] = array('netqnt' => $netqnt, 'price' => $price, 'quantity' => $quantity, 'total' => $total);
                $_SESSION['cart_detail'][$pkgRow->id] =
                    array(
                        'slug' => $pkgRow->slug,
                        'product_details' => $pDetails
                    );
            }

            // removing slug from wishlist
            $userId = $session->get("user_id");
            $wishes = WishList::find_by_user_id($userId);
            $prods = unserialize($wishes->data);
            $pos = array_search($item_slug, $prods);
            unset($prods[$pos]);

            if (empty($prods)) {
                $sql = "DELETE FROM tbl_wishlist WHERE user_id={$userId}";
                
                $db->query($sql);
                $defaultadd = '<p>You have no order images. Would you like to try from homepage?</p>
                    <a href="dhome" class="theme-btn-2 btn btn-effect-2" title="Homepage"> 
                    &#8592;  &nbsp; Go Home
                    </a>';
            } else {
                $wishes->data = serialize($prods);
                $wishes->modified_date = registered();
                $db->begin();
                if ($wishes->save()) {
                    $db->commit();
                }
            }

            $message = $pkgRow->title . ' product added !';
            $total = count($_SESSION['cart_detail']);

            $images = SubProductImage::getImagelist_by($pkgRow->id, 1, 0);
            $img = BASE_URL . 'template/web/img/product/one.jpg';
            if (!empty($images)) {
                foreach ($images as $image) {
                    $file_path = SITE_ROOT . 'images/product/galleryimages/' . $image->image;
                    if (file_exists($file_path)) {
                        $img = IMAGE_PATH . 'product/galleryimages/' . $image->image;
                    }
                }
            }
            $content = '
                <div class="modal-product-img">
                    <img src="' . $img . '" alt="' . $pkgRow->title . '">
                </div>
                <div class="modal-product-info">
                    <h5>' . $pkgRow->title . '</h5>
                    <p class="added-cart"><i class="fa fa-check-circle"></i> ' . 'Successfully added to your Cart' . '</p>
                    <div class="btn-wrapper">
                        <a href="' . BASE_URL . 'cart" class="theme-btn-1 btn btn-effect-1">' . 'View Cart' . '</a>
                        <a href="' . BASE_URL . 'checkout" class="theme-btn-2 btn btn-effect-2">' . 'Checkout' . '</a>
                    </div>
                </div>
            ';
        }

        echo json_encode(array('result' => $message, 'no_cart' => $total, 'defaultmsgadd' => $defaultadd, 'content' => $content));

        break;

    case 'remove_wishlist':

        $message = '';
        $default = '';
        $item_id = !empty($_POST['item_id']) ? ($_POST['item_id']) : '';
        if (!empty($item_id)) {

            $userId = $session->get("user_id");
            $wishlistObj = WishList::find_by_user_id($userId);
            $prods = unserialize($wishlistObj->data);
            $pos = array_search($item_id, $prods);
            unset($prods[$pos]);

            if (empty($prods)) {
                $sql = "DELETE FROM tbl_wishlist WHERE user_id={$userId}";
                $db->query($sql);

                $default = '<p>You have no order images. Would you like to try from homepage?</p>
                <a href="dhome" class="theme-btn-2 btn btn-effect-2" title="Homepage"> 
                &#8592;  &nbsp; Go Home
                </a>';

            } else {
                $wishlistObj->data = serialize($prods);
                $wishlistObj->modified_date = registered();
                $db->begin();
                if ($wishlistObj->save()) {
                    $db->commit();
                }
            }

            $message = 'Product removed !';
        }

        echo json_encode(array('result' => $message, 'defaultmsg' => $default));

        break;

    case 'remove_from_cart':

        $message = '';
        $total = count($_SESSION['cart_detail']);
        $item_id = !empty($_POST['item_id']) ? addslashes($_POST['item_id']) : '';
        /* if (!empty($item_id)) {
            $item_label = !empty($_POST['item_label']) ? addslashes($_POST['item_label']) : '';
            if (!empty($item_label)) {
                unset($_SESSION['cart_detail'][$item_id]['product_details'][$item_label]);
                if (sizeof($_SESSION['cart_detail'][$item_id]['product_details']) == 0) {
                    unset($_SESSION['cart_detail'][$item_id]);
                }
                $total = count($_SESSION['cart_detail']);
                $message = 'Product removed !';
            }
        } */
        if (!empty($item_id)) {
            unset($_SESSION['cart_detail'][$item_id]);
            $total = count($_SESSION['cart_detail']);
            $message = 'Product removed !';
        }

        $sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
        $tot = 0.00;
        $sub_total = 'NPR 0.00';

        if (!empty($sesRec)) {
            foreach ($sesRec as $k => $sesRow) {
                $product = SubProduct::find_by_slug($sesRow['slug']);
                if (!empty($product)) {
                    $product_details = $sesRow['product_details'];
                    foreach ($product_details as $label => $detail) {
                        $tot = (float)$tot + ((float)$detail['quantity'] * (float)$detail['price']);
                        $tot = sprintf("%.2f", $tot);
                    }
                    $sub_total = $product->currency . ' ' . $tot;
                }
            }
        }

        echo json_encode(array('result' => $message, 'no_cart' => $total, 'sub_total' => $sub_total));

        break;
}