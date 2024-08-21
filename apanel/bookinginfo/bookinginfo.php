<?php
$moduleTablename = "tbl_booking_info"; // Database table name
$moduleId = 37;                // module id >>>>> tbl_modules
$moduleFoldername = "";        // Image folder name

if (isset($_GET['page']) && $_GET['page'] == "bookinginfo" && isset($_GET['mode']) && $_GET['mode'] == "list"):
    ?>
    <h3>Product Booking List</h3>
    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <table cellpadding="0" cellspacing="0" border="0" class="table" id="example">
                <thead>
                <tr>
                    <th class="text-center">S.No.</th>
                    <th>Code</th>
                    <th>Fullname</th>
                    <th>Contact Info</th>
                    <th>Date</th>
                    <th>Pay Type</th>
                    <th class="text-center"><?php echo $GLOBALS['basic']['action']; ?></th>
                </tr>
                </thead>

                <tbody>
                <?php $records = Bookinginfo::find_by_sql("SELECT * FROM " . $moduleTablename . " ORDER BY sortorder DESC ");
                $cn = 1;
                foreach ($records as $record): ?>
                    <tr id="<?php echo $record->id; ?>">
                        <td class="text-center"><?php echo $cn++; ?></td>
                        <td><?php echo set_na($record->accesskey); ?></td>
                        <td><?php echo set_na($record->person_fname . ' ' . $record->person_lname); ?></td>
                        <td>Email : <?php echo set_na($record->person_email); ?><br/>Contact No. : <?php echo set_na($record->person_phone); ?></td>
                        <td class="text-center"><?php echo $record->added_date; ?></td>
                        <td class="text-center">
                            <?php 
                                if($record->pay_type == 'Himalayan Bank'){ echo "HBL - ".$record->paymentStatus;}
                                elseif($record->pay_type == 'himalayan_bank'){ echo "HBL - Unsuccess"; }
                                else{echo set_na($record->pay_type);}
                            ?>
                        </td>
                        <td class="text-center">
                            <a href="javascript:void(0);" class="loadingbar-demo btn small bg-green tooltip-button" data-placement="top" title="View"
                               onclick="viewRecord(<?php echo $record->id; ?>);">
                                <i class="glyph-icon icon-eye"></i>
                            </a>
                            <?php if ($record->status != '1') { ?>
                                <a href="javascript:void(0);" class="btn small bg-red tooltip-button" data-placement="top" title="Remove"
                                   onclick="recordDelete(<?php echo $record->id; ?>);">
                                    <i class="glyph-icon icon-remove"></i>
                                </a>
                            <?php } ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

<?php elseif (isset($_GET['mode']) && $_GET['mode'] == "view"):
    if (isset($_GET['id']) && !empty($_GET['id'])):
        $bookingId = addslashes($_REQUEST['id']);
        $bookingRow = Bookinginfo::find_by_id($bookingId);
    endif;
    ?>
    <h3>
        View Order Info (<?php echo $bookingRow->accesskey; ?>)
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);" onClick="viewBookinglist();">
        <span class="glyph-icon icon-separator">
            <i class="glyph-icon icon-arrow-circle-left"></i>
        </span>
            <span class="button-content"> Back </span>
        </a>
    </h3>
    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">

            <div class="col-sm-12">
                <h3>Personal Information</h3>
            </div>

            <div class="col-sm-6">
                <ul>
                    <li><strong>Fullname : </strong><?php echo $bookingRow->person_fname . ' ' . $bookingRow->person_lname; ?></li>
                    <li><strong>Email Address : </strong><?php echo set_na($bookingRow->person_email); ?></li>
                    <li><strong>Country : </strong><?php echo set_na($bookingRow->person_country); ?></li>
                    <li><strong>Country Code : </strong><?php echo set_na($bookingRow->person_country_code); ?></li>
                    <li><strong>City : </strong><?php echo set_na($bookingRow->person_city); ?></li>
                    <li><strong>Region : </strong><?php echo set_na($bookingRow->person_mname); ?></li>
                    <li><strong>Shipping Country: </strong><?php echo $bookingRow->shipping_country; ?></li>
                    <?php if (!empty($bookingRow->coupon_code)) { ?>
                        <li><strong>Coupon Code : </strong><?php echo $bookingRow->coupon_code; ?></li>
                    <?php } ?>
                    <?php if (!empty($bookingRec->shipping_latitude) and !empty($bookingRec->shipping_longitude)) { ?>
                        <li><strong>Shipping Geolocation : </strong>(<?php echo $bookingRow->shipping_latitude; ?>, <?php echo $bookingRow->shipping_latitude; ?>)</li>
                    <?php } ?>
                </ul>
            </div>

            <div class="col-sm-6">
                <ul>
                    <li><strong>Contact No. : </strong><?php echo $bookingRow->person_phone; ?></li>
                    <li>
                        <strong>Ordered Date:</strong>
                        <?php $time = strtotime($bookingRow->added_date);
                        $newformat = date('d M, Y', $time);
                        echo $newformat; ?>
                    </li>
                    <li><strong>Address : </strong><?php echo set_na($bookingRow->person_address); ?></li>
                    <li><strong>District : </strong><?php echo $bookingRow->person_mname; ?></li>
                    <li><strong>Shipping Address: </strong><?php echo $bookingRow->person_shipping_address; ?></li>
                    <li><strong>Shipping District: </strong><?php echo $bookingRow->shipping_district; ?></li>
                    <?php if (!empty($bookingRow->shipping_type)) { ?>
                        <li><strong>Shipping Type : </strong><?php echo $bookingRow->shipping_type; ?></li>
                    <?php } ?>
                    <li><strong>Order Notes : </strong><?php echo $bookingRow->person_comment; ?></li>
                </ul>
            </div>
            <div class="clear"></div>

            <div class="col-sm-12">
                <h4>Purchase Products</h4>
                <ul class="col-sm-12 row">
                    <?php
                    $sql = "SELECT * FROM tbl_booking_product WHERE booking_id='$bookingRow->id' ORDER BY booking_id ASC ";
                    $query = $db->query($sql);
                    $tot = $db->num_rows($query);
                    if ($tot > 0) { ?>
                        <li>
                            <table class="table form-input">
                                <tr class="trip-info">
                                    <th>Product Name</th>
                                    <th>Qty</th>
                                    <th>Price(NPR)</th>
                                    <th>Total Price(NPR)</th>
                                </tr>
                                <?php
                                while ($row = $db->fetch_object($query)) {
                                    // pr($row->additionalprod);
                                    $pkgRec = SubProduct::find_by_id($row->product_id); ?>
                                    <tr>
                                        <td>
                                            <a href="<?php echo BASE_URL . 'product/' . $pkgRec->slug; ?>" target="_blank"><?php echo $pkgRec->title; ?></a>
                                        </td>
                                        <td><?php echo $row->product_quantity; ?></td>
                                        <td><?php echo $row->product_price; ?></td>
                                        <td><?php echo $row->product_total; ?></td>
                                    </tr>
                                    
                                    <?php 
                                    if(isset($row->additionalprod)){
                                    $adddatas= unserialize($row->additionalprod);
                                    $addtotal='';
                                    if(!empty($adddatas)){
                                    foreach($adddatas as $adddata){
                                        // pr($adddata);
                                        $addtotal=(float)$adddata['quantityadd'] * (float)$adddata['price'];
                                        ?>
                                        
                                        <tr>
                                        <td>
                                            <a href="<?php echo BASE_URL . 'product/' . $pkgRec->slug; ?>" target="_blank">+<?php echo $adddata['addname']; ?></a>
                                        </td>
                                        <td><?php echo $adddata['quantityadd']; ?></td>
                                        <td><?php echo $adddata['price']; ?></td>
                                        <td><?php echo $addtotal ?></td>
                                    </tr> 
                                <?php }}}} ?>
                                <tr>
                                    <td colspan="3" align="right">Sub Total</td>
                                    <td><?= $bookingRow->sub_total ?></td>
                                </tr>
                                <?php if (!empty($bookingRow->coupon_code) and $bookingRow->has_coupon == '1') { ?>
                                    <tr>
                                        <td colspan="3" align="right">Coupon Discount</td>
                                        <td><?= $bookingRow->discount_amt ?></td>
                                    </tr>
                                <?php } ?>
                                <tr>
                                    <td colspan="3" align="right">Delivery Charge</td>
                                    <td><?= ($bookingRow->shipping_amt) ? $bookingRow->shipping_amt : '0' ?></td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="right">Grand Total</td>
                                    <td><?= $bookingRow->grand_total ?></td>
                                </tr>
                            </table>
                        </li>
                    <?php } ?>
                </ul>
            </div>
            <div class="clear"></div>

            <div class="col-sm-12">
                <h3>Payment Information</h3>
            </div>

            <div class="col-sm-12">
                <ul>
                    <?php if ($bookingRow->pay_type == "credit_card") { ?>
                        <li><strong>Payment Type : </strong>Credit Card</li>
                        <li><strong>Card No. : </strong><?= $bookingRow->cc_number ?></li>
                        <li><strong>Card ID : </strong><?= $bookingRow->cc_id ?></li>
                        <li><strong>Card Type : </strong><?= $bookingRow->cc_type ?></li>
                        <li><strong>Payment ID : </strong><?= $bookingRow->paymentId ?></li>
                        <li><strong>Payment Status : </strong><?= $bookingRow->paymentStatus ?></li>
                    <?php } else if ($bookingRow->pay_type == "Himalayan Bank") { ?>
                        <li><strong>Payment Type : </strong>Himalayan Bank</li>
                        <li>
                            <strong>Payment Status : </strong><?= $bookingRow->paymentStatus ?><br/>
                            <strong>Card No.: <?php echo $bookingRow->pay_pan; ?></strong><br/>
                            <strong> Payment Transaction Id : <?php echo $bookingRow->paymentId; ?></strong><br>
                            <strong> Payment Date : <?php echo date("F d,Y", strtotime($bookingRow->payment_date)); ?></strong><br/>
                            <?php if (!empty($row['pay_invoice'])) { ?>
                                <strong>Invoice No. : <?php echo ucfirst($bookingRow->pay_invoice) ?></strong><br/>
                                <strong>Bank Approved Code : <?php echo $row->authCode; ?></strong><br/>
                            <?php } ?>
                        </li>
                    <?php } else if ($bookingRow->pay_type == "himalayan_bank") { ?>
                        <li><strong>Payment Type : </strong>Himalayan Bank</li>
                        <li>
                            <strong>Payment Status : </strong>Unsuccess<br/>
                        </li>
                    <?php } else { ?>
                        <li><strong>Payment Type : </strong>Cash on Delivery</li>
                    <?php } ?>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
<?php endif; ?>