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

    case 'ship_district':
        $mainlocation = locationn::find_by_title($location);
        if (!empty($location)) {
            $locations = locationn::get_all_byparnt($mainlocation->id);
        } else {
            $locations = locationn::get_all_bychild();
        }
        $result = '<option value="" data-dc="0" data-lat="27.6772614" data-long="85.3161699">Select Shipping District</option>';
        foreach ($locations as $location) {
            $result .= '<option value="' . $location->title . '" data-dc="' . $location->delivery_charge . '" data-lat="' . $location->latitude . '" data-long="' . $location->longitude . '">' . $location->title . '</option>';
        }
        echo json_encode(array('action' => 'success', 'message' => $result));
        break;

    case 'ship_district_by_id':
        $mainlocation = locationn::find_by_id($location);
        if (!empty($location)) {
            $locations = locationn::get_all_byparnt($mainlocation->id);
        } else {
            $locations = locationn::get_all_bychild();
        }
        $result = '<option value="">Select Shipping District</option>';
        foreach ($locations as $location) {
            $result .= '<option value="' . $location->id . '">' . $location->title . '</option>';
        }
        echo json_encode(array('action' => 'success', 'message' => $result));
        break;

    case 'add_company_code':
        $companyRec = CompanyCode::find_by_code($code);
        if (!empty($companyRec)) {
            $message    = "Company code has been applied!";
            echo json_encode(
                array(
                    'action'    => 'success',
                    'message'   => $message,
                    'code'      => $companyRec->code,
                    'address'   => $companyRec->address,
                    'latitude'  => $companyRec->latitude,
                    'longitude' => $companyRec->longitude
                )
            );
        } else {
            $message = "Company code not applied!";
            echo json_encode(array('action' => 'unsuccess', 'message' => $message));
        }
        break;

    case 'site_district':
        $mainlocation = Site::find_by_title($location);
        if (!empty($location)) {
            $locations = Site::get_all_byparnt($mainlocation->id);
        } else {
            $locations = Site::get_all_bychild();
        }
        $result = '<option value="" data-dc="0" data-lat="27.6772614" data-long="85.3161699">Select Shipping District</option>';
        foreach ($locations as $location) {
            $result .= '<option value="' . $location->title . '" data-dc="' . $location->delivery_charge . '" data-lat="' . $location->latitude . '" data-long="' . $location->longitude . '">' . $location->title . '</option>';
        }
        echo json_encode(array('action' => 'success', 'message' => $result));
        break;

    case "get_home_address":
        $userId = !empty($user_id) && $user_id != 'undefined' ? $user_id : 0;
        $userRec = User::find_by_id($userId);
        if (!empty($userRec)) {
            $shipping_location  = $shipping_district = '';
            $shipping_longitude = 85.3161699;
            $shipping_latitude  = 27.6772614;
            $delivery_charge = '';

            if (!empty($userRec->shipping_location_home)) {
                $locRec             = locationn::find_by_id($userRec->shipping_location_home);
                $shipping_location  = $locRec->title;
            }
            if (!empty($userRec->shipping_district_home)) {
                $locRec             = locationn::find_by_id($userRec->shipping_district_home);
                $shipping_district  = $locRec->title;
                $shipping_longitude = $locRec->longitude;
                $shipping_latitude  = $locRec->latitude;
                $delivery_charge    = $locRec->delivery_charge;
            }

            echo json_encode(
                array(
                    'action'            => 'success',
                    'shipping_location' => $shipping_location,
                    'shipping_district' => $shipping_district,
                    'longitude'         => $shipping_longitude,
                    'latitude'          => $shipping_latitude,
                    'delivery_charge'   => $delivery_charge,
                )
            );
        } else {
            echo json_encode(array('action' => 'unsuccess'));
        }
        break;

    case "get_office_address":
        $userId = !empty($user_id) && $user_id != 'undefined' ? $user_id : 0;
        $userRec = User::find_by_id($userId);
        if (!empty($userRec)) {
            $shipping_location  = $shipping_district = '';
            $shipping_longitude = 85.3161699;
            $shipping_latitude  = 27.6772614;
            $delivery_charge = '';

            if (!empty($userRec->shipping_location_office)) {
                $locRec             = locationn::find_by_id($userRec->shipping_location_office);
                $shipping_location  = $locRec->title;
            }
            if (!empty($userRec->shipping_district_office)) {
                $locRec             = locationn::find_by_id($userRec->shipping_district_office);
                $shipping_district  = $locRec->title;
                $shipping_longitude = $locRec->longitude;
                $shipping_latitude  = $locRec->latitude;
                $delivery_charge    = $locRec->delivery_charge;
            }

            echo json_encode(
                array(
                    'action'            => 'success',
                    'shipping_location' => $shipping_location,
                    'shipping_district' => $shipping_district,
                    'longitude'         => $shipping_longitude,
                    'latitude'          => $shipping_latitude,
                    'delivery_charge'   => $delivery_charge,
                )
            );
        } else {
            echo json_encode(array('action' => 'unsuccess'));
        }
        break;
}