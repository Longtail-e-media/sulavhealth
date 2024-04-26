<?php

require_once("includes/initialize.php");

foreach ($_POST as $key => $val) {
    $$key = $val;
}

$lang = !empty($session->get('lang_type')) ? $session->get('lang_type') : 'gr';

switch ($_POST['action']) {
    case 'add_coupon':
        $couponRec = Coupon::find_by_code($coupon);
        if (!empty($couponRec)) {
            $today = date('Y-m-d');
            if ($couponRec->start_date <= $today and $couponRec->end_date >= $today) {
                $message = "Coupon code has been applied!";
                echo json_encode(
                    array(
                        'action' => 'success',
                        'message' => $message,
                        'code' => $couponRec->code,
                        'discount' => $couponRec->discount
                    )
                );
            } else {
                $message = "Coupon code has expired!";
                echo json_encode(array('action' => 'unsuccess', 'message' => $message));
            }
        } else {
            $message = "Coupon code not found!";
            echo json_encode(array('action' => 'unsuccess', 'message' => $message));
        }

        break;

    case 'ship_country':
        if ($country == 'Greece') {
            $sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
            $weight = 0;
            $shippingCost = 3.0;
            if (!empty($sesRec)) {
                foreach ($sesRec as $k => $sesRow) {
                    $product = SubProduct::find_by_slug($sesRow['slug']);
                    if (!empty($product)) {
                        $product_details = $sesRow['product_details'];
                        foreach ($product_details as $label => $detail) {
                            // getting only numbers from gross weight
                            $str = preg_replace('/[^0-9.]+/', '', $label);
                            $weight += (float)$str;
                        }
                    }
                }
                // Shipments up to 2 kg is 3.00 €
                // For every additional 1 kg = 0.80 €
                $newWeight = ceil($weight / 1000);
                $additionalWeight = $newWeight - 2;
                $additionalCost = 0;
                if ($additionalWeight > 0) {
                    $additionalCost = (float)$additionalWeight * 0.8;
                }
                $shippingCost = (float)$shippingCost + (float)$additionalCost;
            }
            echo json_encode(array('shipping_cost' => $shippingCost, 'choose_type' => 'no'));
        } else {
            $shippingCost = 0;
            $shippingCountry = ShippingCountries::find_by_name($country);
            if (!empty($shippingCountry)) {
                $sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
                $weight = 0;
                if (!empty($sesRec)) {
                    foreach ($sesRec as $k => $sesRow) {
                        $product = SubProduct::find_by_slug($sesRow['slug']);
                        if (!empty($product)) {
                            $product_details = $sesRow['product_details'];
                            foreach ($product_details as $label => $detail) {
                                // getting only numbers from gross weight
                                $str = preg_replace('/[^0-9.]+/', '', $label);
                                $weight += (float)$str;
                            }
                        }
                    }
                    $newWeight = $weight / 1000;

                    // getting array of weights and getting Id of corresponding weight
                    $shippingWeights = ShippingPrices::find_all();
                    $weightId = 0;
                    foreach ($shippingWeights as $shippingWeight) {
                        if ($newWeight >= 40) {
                            $weightId = 30;
                            break;
                        }
                        if ($shippingWeight->weight >= $newWeight) {
                            $weightId = $shippingWeight->id;
                            break;
                        }
                    }

                    $shippingWeightPrice = ShippingPrices::find_by_id($weightId);
                    if (!empty($shippingWeightPrice)) {
                        $zones = unserialize($shippingWeightPrice->zone);
                        $shippingCost = $zones[$shippingCountry->zone];
                        $chooseType = ($shippingCountry->zone == 1) ? 'yes' : 'no';
                    }
                }
            }
            echo json_encode(array('shipping_cost' => $shippingCost, 'choose_type' => $chooseType));
        }
        break;

    case 'ship_country_type':
        $shippingCost = 0;
        $shippingCountry = ShippingCountries::find_by_name($country);
        if (!empty($shippingCountry)) {
            $sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
            $weight = 0;
            if (!empty($sesRec)) {
                foreach ($sesRec as $k => $sesRow) {
                    $product = SubProduct::find_by_slug($sesRow['slug']);
                    if (!empty($product)) {
                        $product_details = $sesRow['product_details'];
                        foreach ($product_details as $label => $detail) {
                            // getting only numbers from gross weight
                            $str = preg_replace('/[^0-9.]+/', '', $label);
                            $weight += (float)$str;
                        }
                    }
                }
                $newWeight = $weight / 1000;

                // getting array of weights and getting Id of corresponding weight
                $shippingWeights = ShippingPrices::find_all();
                $weightId = 0;
                foreach ($shippingWeights as $shippingWeight) {
                    if ($newWeight >= 40) {
                        $weightId = 30;
                        break;
                    }
                    if ($shippingWeight->weight >= $newWeight) {
                        $weightId = $shippingWeight->id;
                        break;
                    }
                }

                $shippingWeightPrice = ShippingPrices::find_by_id($weightId);
                if (!empty($shippingWeightPrice)) {
                    $zones = unserialize($shippingWeightPrice->zone);
                    $zone = $zones[$shippingCountry->zone];
                    $shippingCost = $zone[$type];
                }
            }
        }
        echo json_encode(array('shipping_cost' => $shippingCost));
        break;
}