<?php
$subpackageTablename = "tbl_product_sub"; // Database table name
$type = array(1 => 'Product', 2 => 'Package');
foreach ($type as $key => $s_id) {
    $u_type_id = $key;
}
$typeid = (!empty($session->get('type_id_product'))) ? $session->get('type_id_product') : 1;
if (isset($_GET['page']) && $_GET['page'] == "product" && isset($_GET['mode']) && $_GET['mode'] == "list"):
    // $id = intval(addslashes($_GET['id']));

    clearImages($subpackageTablename, "product/banner", "banner_image");
    clearImages($subpackageTablename, "product/banner/thumbnails", "banner_image");

    clearImages("tbl_subproduct_images", "product/galleryimages");
    clearImages("tbl_subproduct_images", "product/galleryimages/thumbnails");
    ?>

    <h3>
        <?php
        if (!empty($type)) {
            $select_html = '<div class="pad0L col-md-3"><select class="user-product-select">';
            foreach ($type as $key => $types) {
                $select_html .= '<option value="' . $key . '" ' . ($key == $typeid ? ' selected' : '') . '>' . $types . '</option>';
            }
            $select_html .= '</select></div>';
            echo $select_html;
        }
        ?>
        List

        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);" onClick="addNewSubProduct(<?php echo $typeid; ?>);">
            <span class="glyph-icon icon-separator"><i class="glyph-icon icon-plus-square"></i></span>
            <span class="button-content"> Add New </span>
        </a>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right mrg5R" href="javascript:void(0);" onClick="viewProductList();">
            <span class="glyph-icon icon-separator"><i class="glyph-icon icon-arrow-circle-left"></i></span>
            <span class="button-content"> Back </span>
        </a>
    </h3>

    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <table cellpadding="0" cellspacing="0" border="0" class="table" id="subexample">
                <thead>
                <tr>
                    <th style="display:none;"></th>
                    <th class="text-center"><input class="check-all" type="checkbox"/></th>
                    <th>Title</th>
                    <th>Amount</th>
                    <th>Discount Percentage</th>
                    <th>Discounted Amt</th>
                    <th class="text-center"></th>
                    <th class="text-center"><?php echo $GLOBALS['basic']['action']; ?></th>
                </tr>
                </thead>

                <tbody>
                <?php $records = SubProduct::find_by_sql("SELECT * FROM " . $subpackageTablename . " WHERE type=" . $typeid . " ORDER BY sortorder DESC ");
                foreach ($records as $key => $record): ?>
                    <tr id="<?php echo $record->id; ?>">
                        <td style="display:none;"><?php echo $key + 1; ?></td>
                        <td><input type="checkbox" class="bulkCheckbox" bulkId="<?php echo $record->id; ?>"/></td>
                        <td>
                            <div class="col-md-7">
                                <a href="javascript:void(0);" onClick="editSubProduct(<?php echo $record->type; ?>,<?php echo $record->id; ?>);"
                                   class="loadingbar-demo" title="<?php echo $record->title; ?>"><?php echo $record->title; ?></a>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-7">
                               <?php echo $record->price1; ?>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-7">
                               <?php $discountper= (!empty($record->discountedp)) ? $record->discountedp . "%" : "N/A"; echo $discountper;  ?>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-7">
                               <?php $discountamt= (!empty($record->discount1)) ? $record->discount1 : "N/A"; echo $discountamt; ?>
                            </div>
                        </td>
                        <td class="text-center">
                            <a class="primary-bg medium btn loadingbar-demo" title="" onClick="viewSubImageList(<?php echo $record->id; ?>);"
                               href="javascript:void(0);">
                                <span class="button-content">
                                    <span class="badge bg-orange radius-all-4 mrg5R" title="" data-original-title="Badge with tooltip">
                                        <?php echo $countImages = SubProductImage::getTotalImages($record->id); ?></span>
                                    <span class="text-transform-upr font-bold font-size-11">View List</span>
                                </span>
                            </a>
                        </td>
                        <td class="text-center">
                            <?php
                            $statusImage = ($record->status == 1) ? "bg-green" : "bg-red";
                            $statusText = ($record->status == 1) ? $GLOBALS['basic']['clickUnpub'] : $GLOBALS['basic']['clickPub'];
                            ?>
                            <a href="javascript:void(0);" class="btn small <?php echo $statusImage; ?> tooltip-button statusSubToggler" data-placement="top"
                               title="<?php echo $statusText; ?>" status="<?php echo $record->status; ?>" id="imgHolder_<?php echo $record->id; ?>"
                               moduleId="<?php echo $record->id; ?>">
                                <i class="glyph-icon icon-flag"></i>
                            </a>
                            <a href="javascript:void(0);" class="loadingbar-demo btn small bg-blue-alt tooltip-button" data-placement="top" title="Edit"
                               onclick="editSubProduct(<?php echo $record->type; ?>,<?php echo $record->id; ?>);">
                                <i class="glyph-icon icon-edit"></i>
                            </a>
                            <a href="javascript:void(0);" class="btn small bg-red tooltip-button" data-placement="top" title="Remove"
                               onclick="subProductDelete(<?php echo $record->id; ?>);">
                                <i class="glyph-icon icon-remove"></i>
                            </a>
                            <input name="sortId" type="hidden" value="<?php echo $record->id; ?>">
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
        <div class="pad0L col-md-2">
            <select name="dropdown" id="groupTaskField" class="custom-select">
                <option value="0"><?php echo $GLOBALS['basic']['choseAction']; ?></option>
                <option value="subdelete"><?php echo $GLOBALS['basic']['delete']; ?></option>
                <option value="subtoggleStatus"><?php echo $GLOBALS['basic']['toggleStatus']; ?></option>
            </select>
        </div>
        <a class="btn medium primary-bg" href="javascript:void(0);" id="applySelected_btn">
            <span class="glyph-icon icon-separator float-right"><i class="glyph-icon icon-cog"></i></span>
            <span class="button-content"> Submit </span>
        </a>
    </div>

<?php elseif (isset($_GET['mode']) && $_GET['mode'] == "addEditSubProduct"):
    // $pid = addslashes($_REQUEST['id']);
    $id = addslashes($_GET['id']);
    if (isset($_GET['subid']) and !empty($_GET['subid'])):
        $subproductId = addslashes($_REQUEST['subid']);
        $subproductInfo = SubProduct::find_by_id($subproductId);
        $moduleTablename = "tbl_product";
        $homepage = ($subproductInfo->homepage == 1) ? "checked" : " ";
        $nothomepage = ($subproductInfo->homepage == 0) ? "checked" : " ";
        $status = ($subproductInfo->status == 1) ? "checked" : " ";
        $unstatus = ($subproductInfo->status == 0) ? "checked" : " ";
    endif;
    $initialType = 1;
    ?>

    <h3>
        <?php echo (isset($_GET['subid'])) ? 'Edit' : 'Add'; ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="viewProductList();">
            <span class="glyph-icon icon-separator"><i class="glyph-icon icon-arrow-circle-left"></i></span>
            <span class="button-content"> Back </span>
        </a>
    </h3>

    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <form action="" class="col-md-12 center-margin" id="subproduct_frm">
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Service :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <?php $selid = !empty($subproductInfo->service_id) ? $subproductInfo->service_id : 0; ?>
                        <select data-placeholder="Choose" class="chosen-selec validate[required,length[0,500]]" id="service_id" name="service_id">
                            <?php echo Services::get_internal_link_product($selid); ?>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Category :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <?php $cid = !empty($subproductInfo->Category) ? $subproductInfo->Category : 0; ?>
                        <select data-placeholder="Choose Field Type" class="chosen-selec validate[required,length[0,500]] Category" id="Category" name="Category"
                                selcId="<?php echo $cid; ?>">
                            <?php 
                            // $categories = Category::find_by_sql("SELECT * FROM tbl_category WHERE parentId=0 AND type={$typeid} ORDER BY sortorder ASC ");
                            $categories = Category::find_by_sql("SELECT * FROM tbl_category WHERE parentId=0 ORDER BY sortorder ASC ");
                            // pr($categories);
                            if ($categories) {
                                foreach ($categories as $k => $category) {
                                    if($k == 0){$initialType = $category->type;}
                                    $cat = $category->id;
                                    $sel = (!empty($cat) && $cat == $subproductInfo->Category) ? 'selected' : '';
                                    $initialType = (!empty($cat) && $cat == $subproductInfo->Category) ? $category->type : $initialType;?>
                                    <option value="<?= $category->id; ?>" <?= $sel; ?> selType="<?= $category->type; ?>"><?= $category->title; ?></option>
                                <?php }
                            } ?>
                        </select>
                    </div>
                </div>

                <input type="hidden" name="type" id="type" value="<?php echo $initialType; ?>"/>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Sub Category :
                        </label>
                    </div>
                    <div class="form-input col-md-6">

                        <?php $selid = !empty($subproductInfo->Subcategory) ? $subproductInfo->Subcategory : 0; ?>
                        <select data-placeholder="Choose Field Type" class="chosen-selec validate[required,length[0,500]] Subcategory" id="Subcategory" name="Subcategory"
                                selId="<?php echo $selid; ?>">
                            <?php $pId = !empty($subproductInfo->Category) ? $subproductInfo->Category : 0;
                            echo Category::get_all_filterdata($pId, $selid); ?>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Brand :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <select data-placeholder="Choose Field Type" class="chosen-selec validate[required,length[0,500]]" id="brand" name="brand">
                            <?php $categories = Brand::find_by_sql("SELECT * FROM tbl_brands ORDER BY sortorder DESC ");
                            if ($categories) {
                                foreach ($categories as $category) {
                                    $cat = !empty($subproductInfo->brand) ? $subproductInfo->brand : '';
                                    $sel = (!empty($cat) && $cat == $category->id) ? 'selected' : ''; ?>
                                    <option value="<?= $category->id; ?>" <?= $sel; ?>><?= $category->title; ?></option>
                                <?php }
                            } ?>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Title :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <input placeholder="Title" class="col-md-6 validate[required,length[0,250]]" type="text" name="title" id="title" style="width:100%;"
                               value="<?php echo !empty($subproductInfo->title) ? $subproductInfo->title : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Additional Products:
                        </label>
                    </div>
                    <div class="form-input col-md-8">
                        <?php 
                        $svfr = !empty($subproductInfo->additional) ? $subproductInfo->additional : '';
                        $saveRec = unserialize(base64_decode($svfr));
                        if(!empty($saveRec)){
                            
                            foreach($saveRec as $recdata){
                            
                                // $child_id = $recdata->id;
                                // $child_title = isset($saveRec[$child_id]['id']) ? $saveRec[$child_id]['title'] : $recdata->title;
                                ?>
                        <div>
                            <input placeholder="Title" class="col-md-4 validate[required,length[0,250]]" type="text" name="additional[<?php echo $recdata['id']?>][name]"
                               value="<?php echo !empty($recdata['name']) ? $recdata['name'] : ""; ?>">
                            <input placeholder="qty" class="col-md-3 validate[required,length[0,250]]" type="text" name="additional[<?php echo $recdata['id'] ?>][qty]"
                               value="<?php echo !empty($recdata['qty']) ? $recdata['qty'] : ""; ?>">
                            <input placeholder="price" class="col-md-3 validate[required,length[0,250]]" type="text" name="additional[<?php echo $recdata['id'] ?>][price]"
                               value="<?php echo !empty($recdata['price']) ? $recdata['price'] : ""; ?>">
                            <span class="cp remove_feature_row"><i class="glyph-icon icon-minus-square"></i></span><br>
                        </div>
                        <?php
                                      } 
                        }else{?>
                        <input placeholder="Title" class="col-md-4 validate[required,length[0,250]]" type="text" name="additional[1][name]"
                               value="">
                               <input placeholder="Title" class="col-md-3 validate[required,length[0,250]]" type="text" name="additional[1][qty]"
                               value="">
                               <input placeholder="Title" class="col-md-3 validate[required,length[0,250]]" type="text" name="additional[1][price]"
                               value="">
                    

                        <?php }?>
                    </div>

                    
                        <div id="add_option_div"></div>
                        <a href="javascript:void(0);" class="btn medium bg-blue tooltip-button" title="Add" onclick="addFeaturesRows();">
                            <i class="glyph-icon icon-plus-square"></i>
                        </a> 
                    
                </div>

                 <!-- Feature Listing -->
                 <?php $svfr = !empty($rowInfo->additional) ? $rowInfo->additional : '';
                $saveRec = unserialize(base64_decode($svfr));

                if (!empty($saveRec)) {
                    foreach ($saveRec as $recRow) { ?>
                        <div class="form-row">
                            <div class="form-label col-md-2">
                                <label for="">
                                    <?php echo $recRow->title; ?> :
                                </label>
                            </div>
                            <?php

                            ?>
                            <div class="form-checkbox-radio col-md-10 form-input">
                                <input type="text" placeholder="Title" class="col-md-4 validate[length[0,250]]"
                                       name="fparent[<?php echo $recRow->id; ?>][name]" value="<?php echo $savedTitle; ?>">
                                <div class="clear"></div>
                                <div class="d-flex">
                                    <div class="row">
                                <?php

                                            $check = isset($childRow['id']) ? 'checked="checked"' : ''; ?>
                                            <div><input type="checkbox" class="custom-radio"
                                                        name="feature[<?php echo $recRow->id; ?>][<?php echo $child_id; ?>][id]"
                                                        value="<?php echo $child_id; ?>" <?php echo $check; ?>>
                                                <input type="text" placeholder="Icon Class" class="col-md-2 validate[length[0,30]]"
                                                       name="feature[<?php echo $recRow->id; ?>][<?php echo $child_id; ?>][icon_class]"
                                                       value="<?php echo $childRow['icon_class']; ?>">
                                                <input type="text" placeholder="Title" class="col-md-6 validate[length[0,100]]"
                                                       name="feature[<?php echo $recRow->id; ?>][<?php echo $child_id; ?>][title]"
                                                       value="<?php echo $childRow['title']; ?>">
                                                <span class="cp remove_feature_row"><i class="glyph-icon icon-minus-square"></i></span><br></div>
                                    
                                    </div>
                                </div>
                                <div id="add_option_div<?php echo $recRow->id; ?>"></div>
                                    <a href="javascript:void(0);" class="btn medium bg-blue tooltip-button" title="Add" onclick="addFeaturesRows('<?php echo $recRow->id; ?>');">
                                        <i class="glyph-icon icon-plus-square"></i>
                                    </a> 
                                </div>
                        </div>
                    <?php }
                } 
                else{
                    
                }?>

                <!--<div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">Title (Greek):</label>
                    </div>
                    <div class="form-input col-md-14">
                        <input placeholder="Title (Greek)" class="col-md-6" type="text" name="title_greek" id="title_greek"
                               value="<?php echo !empty($subproductInfo->title_greek) ? $subproductInfo->title_greek : ''; ?>">
                    </div>
                </div>-->

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Tag Line :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <input placeholder="Tag" class="col-md-6 validate[length[0,250]]" type="text" name="tag" id="tag" style="width:100%"
                               value="<?php echo !empty($subproductInfo->tag) ? $subproductInfo->tag : ""; ?>">
                    </div>
                </div>

                <!--
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Currency :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Currency" class="col-md-6 validate[required,length[0,50]]" type="text" name="currency" id="currency"
                               value="<?php echo !empty($subproductInfo->currency) ? $subproductInfo->currency : ""; ?>">
                    </div>
                </div>
                -->
                <input type="hidden" name="currency" value="NPR">

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Quantity / Price :
                        </label>
                    </div>
                    <div class="form-input col-md-10">
                        <input placeholder="Gross Weight " class="col-md-2 validate[required,length[0,50]]" type="text" name="netqnt1" id="netqnt1"
                               value="<?php echo !empty($subproductInfo->netqnt1) ? $subproductInfo->netqnt1 : ""; ?>">
                        <!--<input placeholder="Gross Weight 1" class="col-md-2 validate[required,length[0,50]]" type="text" name="qnt1" id="qnt1"
                               value="<?php echo !empty($subproductInfo->qnt1) ? $subproductInfo->qnt1 : ""; ?>">-->
                        <input placeholder="Price 1" class="col-md-2 validate[required,length[0,50]]" type="number" step="0.01" min="0" name="price1" id="price1"
                               value="<?php echo !empty($subproductInfo->price1) ? $subproductInfo->price1 : ""; ?>">
                               <input placeholder="Discounted percentage " class="col-md-2 validate[length[0,50]]" type="number" step="0.01" min="0" name="discountedp"
                               id="discountedp" value="<?php echo !empty($subproductInfo->discountedp) ? $subproductInfo->discountedp : ""; ?>">
                               <input placeholder="Discount Price " class="col-md-2 validate[length[0,50]]" type="number" step="0.01" min="0" name="discount1"
                               id="discount1" value="<?php echo !empty($subproductInfo->discount1) ? $subproductInfo->discount1 : ""; ?>">
                        
                        <!--<br><br>-->

                        <!--<input placeholder="Gross Weight 2" class="col-md-2 validate[length[0,50]]" type="text" name="netqnt2" id="netqnt2"
                               value="<?php echo !empty($subproductInfo->netqnt2) ? $subproductInfo->netqnt2 : ""; ?>">
                        <input placeholder="Gross Weight 2" class="col-md-2 validate[length[0,50]]" type="text" name="qnt2" id="qnt2"
                               value="<?php echo !empty($subproductInfo->qnt2) ? $subproductInfo->qnt2 : ""; ?>">
                        <input placeholder="Price 2" class="col-md-2 validate[length[0,50]]" type="number" step="0.01" min="0" name="price2" id="price2"
                               value="<?php echo !empty($subproductInfo->price2) ? $subproductInfo->price2 : ""; ?>">
                        <input placeholder="Discount Price 2" class="col-md-2 validate[length[0,50]]" type="number" step="0.01" min="0" name="discount2"
                               id="discount2" value="<?php echo !empty($subproductInfo->discount2) ? $subproductInfo->discount2 : ""; ?>">
                        <br><br>-->

                        <!--<input placeholder="Gross Weight 3" class="col-md-2 validate[length[0,50]]" type="text" name="netqnt3" id="netqnt3"
                               value="<?php echo !empty($subproductInfo->netqnt3) ? $subproductInfo->netqnt3 : ""; ?>">
                        <input placeholder="Gross Weight 3" class="col-md-2 validate[length[0,50]]" type="text" name="qnt3" id="qnt3"
                               value="<?php echo !empty($subproductInfo->qnt3) ? $subproductInfo->qnt3 : ""; ?>">
                        <input placeholder="Price 3" class="col-md-2 validate[length[0,50]]" type="number" step="0.01" min="0" name="price3" id="price3"
                               value="<?php echo !empty($subproductInfo->price3) ? $subproductInfo->price3 : ""; ?>">
                        <input placeholder="Discount Price 3" class="col-md-2 validate[length[0,50]]" type="number" step="0.01" min="0" name="discount3"
                               id="discount3" value="<?php echo !empty($subproductInfo->discount3) ? $subproductInfo->discount3 : ""; ?>">
                        <br><br>-->

                        <!--<input placeholder="Gross Weight 4" class="col-md-2 validate[length[0,50]]" type="text" name="netqnt4" id="netqnt4"
                               value="<?php echo !empty($subproductInfo->netqnt4) ? $subproductInfo->netqnt4 : ""; ?>">
                        <input placeholder="Gross Weight 4" class="col-md-2 validate[length[0,50]]" type="text" name="qnt4" id="qnt4"
                               value="<?php echo !empty($subproductInfo->qnt4) ? $subproductInfo->qnt4 : ""; ?>">
                        <input placeholder="Price 4" class="col-md-2 validate[length[0,50]]" type="number" step="0.01" min="0" name="price4" id="price4"
                               value="<?php echo !empty($subproductInfo->price4) ? $subproductInfo->price4 : ""; ?>">
                        <input placeholder="Discount Price 4" class="col-md-2 validate[length[0,50]]" type="number" step="0.01" min="0" name="discount4"
                               id="discount4" value="<?php echo !empty($subproductInfo->discount4) ? $subproductInfo->discount4 : ""; ?>">-->
                    </div>
                </div>

                <div class="form-row add-image">
                    <div class="form-label col-md-2">
                        <label for="">
                            Banner Image :
                        </label>
                    </div>
                    <div class="form-input col-md-10 uploader">
                        <input type="file" name="image_upload" id="image_upload" class="transparent no-shadow">
                        <label>
                            <small>Image Dimensions (1520 px X 320 px)</small>
                        </label>
                    </div>
                    <!-- Upload user image preview -->
                    <div id="preview_Image2"></div>
                </div>

                <div class="form-row">
                    <?php
                    if (!empty($subproductInfo->banner_image)):
                        $imageRow2 = $subproductInfo->banner_image; ?>
                        <div class="col-md-3" id="removeSavedimg00101">
                            <div class="infobox info-bg">
                                <div class="button-group" data-toggle="buttons">
                                    <span class="float-left">
                                        <?php
                                        if (file_exists(SITE_ROOT . "images/product/banner/" . $imageRow2)):
                                            $filesize = filesize(SITE_ROOT . "images/product/banner/" . $imageRow2);
                                            echo 'Size : ' . getFileFormattedSize($filesize);
                                        endif;
                                        ?>
                                    </span>
                                    <a class="btn small float-right" href="javascript:void(0);" onclick="deleteSavedProductBanner('00101');">
                                        <i class="glyph-icon icon-trash-o"></i>
                                    </a>
                                </div>
                                <img src="<?php echo IMAGE_PATH . 'product/banner/thumbnails/' . $imageRow2; ?>" style="width:100%"/>
                                <input type="hidden" name="imageArrayname2" value="<?php echo $imageRow2; ?>"/>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="brief">
                            Brief :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <div class="form-input">
                            <textarea placeholder="Brief" class="col-md-6 validate[required]" name="brief" id="brief"
                                      type="text"><?php echo !empty($subproductInfo->brief) ? $subproductInfo->brief : ""; ?></textarea>
                        </div>
                    </div>
                </div>

                <!--<div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="brief_greek">
                            Brief (Greek) :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <textarea placeholder="Brief (Greek)" class="col-md-6 validate[required]" type="text" name="brief_greek"
                                  id="brief_greek"><?php echo !empty($subproductInfo->brief_greek) ? $subproductInfo->brief_greek : ""; ?></textarea>
                    </div>
                </div>-->

                <div class="form-row">
                    <div class="form-label col-md-10">
                        <label for="">
                            Content :
                        </label>
                        <textarea name="content" id="content"
                                  class="large-textarea"><?php echo !empty($subproductInfo->content) ? $subproductInfo->content : ""; ?></textarea>
                        <a class="btn medium bg-orange mrg5T" title="Read More" id="readMore"
                           href="javascript:void(0);">
                            <span class="button-content">Read More</span>
                        </a>
                    </div>
                </div>

                <!--<div class="form-row">
                    <div class="form-label col-md-10">
                        <label for="">
                            Content (Greek) :
                        </label>
                        <textarea name="content_greek" id="content_greek"
                                  class="large-textarea"><?php echo !empty($subproductInfo->content_greek) ? $subproductInfo->content_greek : ""; ?></textarea>
                        <a class="btn medium bg-orange mrg5T" title="Read More" id="readMore1"
                           href="javascript:void(0);">
                            <span class="button-content">Read More</span>
                        </a>
                    </div>
                </div>-->
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Homepage :
                        </label>
                    </div>
                    <div class="form-checkbox-radio col-md-9">
                        <input type="radio" class="custom-radio" name="homepage" id="homepage1"
                               value="1" <?php echo !empty($homepage) ? $homepage : ""; ?>>
                        <label for="">featured</label>
                        <input type="radio" class="custom-radio" name="homepage" id="homepage0"
                               value="0" <?php echo !empty($nothomepage) ? $nothomepage : "checked"; ?>>
                        <label for="">Not featured</label>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Published :
                        </label>
                    </div>
                    <div class="form-checkbox-radio col-md-9">
                        <input type="radio" class="custom-radio" name="status" id="check1"
                               value="1" <?php echo !empty($status) ? $status : "checked"; ?>>
                        <label for="">Published</label>
                        <input type="radio" class="custom-radio" name="status" id="check0"
                               value="0" <?php echo !empty($unstatus) ? $unstatus : ""; ?>>
                        <label for="">Un-Published</label>
                    </div>
                </div>

                <!-- Meta Tags-->
                <div class="form-row">
                    <div class="form-checkbox-radio col-md-9">
                        <a class="btn medium bg-blue" href="javascript:void(0);" onClick="toggleMetadata();">
                        <span class="glyph-icon icon-separator float-right">
                            <i class="glyph-icon icon-caret-down"></i>
                        </span>
                            <span class="button-content"> Metadata Info </span>
                        </a>
                    </div>
                </div>
                <div class="form-row <?php echo (!empty($subproductInfo->meta_keywords) || !empty($subproductInfo->meta_description) || !empty($subproductInfo->meta_title)) ? '' : 'hide'; ?> metadata">
                    <div class="col-md-12">
                        <div class="form-input col-md-12">
                            <input placeholder="Meta Title" class="col-md-6 validate[required]" type="text"
                                   name="meta_title" id="meta_title"
                                   value="<?php echo !empty($subproductInfo->meta_title) ? $subproductInfo->meta_title : ""; ?>">
                        </div>
                        <br/>
                        <div class="form-input col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <textarea placeholder="Meta Keyword" name="meta_keywords" id="meta_keywords"
                                              class="character-keyword validate[required]"><?php echo !empty($subproductInfo->meta_keywords) ? $subproductInfo->meta_keywords : ""; ?></textarea>
                                    <div class="keyword-remaining clear input-description">250 characters left</div>
                                </div>
                                <div class="col-md-6">
                                    <textarea placeholder="Meta Description" name="meta_description"
                                              id="meta_description"
                                              class="character-description validate[required]"><?php echo !empty($subproductInfo->meta_description) ? $subproductInfo->meta_description : ""; ?></textarea>
                                    <div class="description-remaining clear input-description">160 characters left</div>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <!--<div class="form-input col-md-12">
                            <div class="row">
                                <div class="col-md-4">
                    <textarea placeholder="Meta Title Greek" name="meta_title_greek" id="meta_title_greek" class="character-keyword"
                    ><?php echo !empty($subproductInfo->meta_title_greek) ? $subproductInfo->meta_title_greek : ""; ?></textarea>
                                </div>
                                <div class="col-md-4">
                    <textarea placeholder="Meta Keywords Greek" name="meta_keywords_greek" id="meta_keywords_greek"
                              class="character-keyword-gr"><?php echo !empty($subproductInfo->meta_keywords_greek) ? $subproductInfo->meta_keywords_greek : ""; ?></textarea>
                                    <div class="keyword-remaining-gr clear input-description">250 characters left</div>
                                </div>
                                <div class="col-md-4">
                    <textarea placeholder="Meta Keywords Greek" name="meta_description_greek" id="meta_description_greek"
                              class="character-description-gr"><?php echo !empty($subproductInfo->meta_description_greek) ? $subproductInfo->meta_description_greek : ""; ?></textarea>
                                    <div class="description-remaining-gr clear input-description">160 characters left</div>
                                </div>
                            </div>
                        </div>-->
                    </div>

                </div>


                <button btn-action='0' type="submit" name="submit"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4"
                        id="btn-submit" title="Save">
                    <span class="button-content">Save</span>
                </button>
                <button btn-action='1' type="submit" name="submit"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4"
                        id="btn-submit" title="Save">
                    <span class="button-content">Save & More</span>
                </button>
                <button btn-action='2' type="submit" name="submit"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4"
                        id="btn-submit" title="Save">
                    <span class="button-content">Save & quit</span>
                </button>
                <input myaction='0' type="hidden" name="idValue" id="idValue"
                       value="<?php echo !empty($subproductInfo->id) ? $subproductInfo->id : 0; ?>"/>

            </form>
        </div>
    </div>
    <script>
        var base_url = "<?php echo ASSETS_PATH; ?>";
        var editor_arr = ["content"];
        create_editor(base_url, editor_arr);
        //create_editor1(base_url, ["content_greek"]);
    </script>

    <link href="<?php echo ASSETS_PATH; ?>uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<?php echo ASSETS_PATH; ?>uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript">
        // <![CDATA[
        $(document).ready(function () {
            $('#image_upload').uploadify({
                'swf': '<?php echo ASSETS_PATH;?>uploadify/uploadify.swf',
                'uploader': '<?php echo ASSETS_PATH;?>uploadify/uploadify.php',
                'formData': {
                    PROJECT: '<?php echo SITE_FOLDER;?>',
                    targetFolder: 'images/product/banner/',
                    thumb_width: 380,
                    thumb_height: 478
                },
                'method': 'post',
                'cancelImg': '<?php echo BASE_URL;?>uploadify/cancel.png',
                'auto': true,
                'multi': false,
                'hideButton': false,
                'buttonText': 'Upload Image',
                'width': 125,
                'height': 21,
                'removeCompleted': true,
                'progressData': 'speed',
                'uploadLimit': 100,
                'fileTypeExts': '*.gif; *.jpg; *.jpeg;  *.png; *.GIF; *.JPG; *.JPEG; *.PNG;',
                'buttonClass': 'button formButtons',
                /* 'checkExisting' : '/uploadify/check-exists.php',*/
                'onUploadSuccess': function (file, data, response) {
                    $('#uploadedImageName').val('1');
                    var filename = data;
                    $.post('<?php echo BASE_URL;?>apanel/product/uploaded_image_sub2.php', {imagefile: filename}, function (msg) {
                        $('#preview_Image2').html(msg).show();
                    });

                },
                'onDialogOpen': function (event, ID, fileObj) {
                },
                'onUploadError': function (file, errorCode, errorMsg, errorString) {
                    alert(errorMsg);
                },
                'onUploadComplete': function (file) {
                    //alert('The file ' + file.name + ' was successfully uploaded');
                }
            });
        });
        // ]]>
    </script>

<?php endif;
include("subproduct_images.php"); ?>
