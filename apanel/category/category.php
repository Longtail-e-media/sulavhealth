<link href="<?php echo ASSETS_PATH; ?>uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
<?php
$moduleTablename = "tbl_category"; // Database table name
$moduleId = 21;                // module id >>>>> tbl_modules
$moduleFoldername = "";        // Image folder name

if (isset($_GET['page']) && $_GET['page'] == "category" && isset($_GET['mode']) && $_GET['mode'] == "list"):
    clearImages($moduleTablename, "category");
    clearImages($moduleTablename, "category/thumbnails");
    $parentId = (isset($_REQUEST['id']) and !empty($_REQUEST['id'])) ? addslashes($_REQUEST['id']) : 0;
    ?>
    <h3>
        List category
        <?php if (!empty($_REQUEST['id'])) { ?>
            <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
               onClick="viewcategorylist(0);">
                <span class="glyph-icon icon-separator"><i class="glyph-icon icon-arrow-circle-left"></i></span>
                <span class="button-content"> Back </span>
            </a>
        <?php } ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="AddNewcategory();">
            <span class="glyph-icon icon-separator"><i class="glyph-icon icon-plus-square"></i></span>
            <span class="button-content"> Add New </span>
        </a>
    </h3>
    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <table cellpadding="0" cellspacing="0" border="0" class="table" id="example">
                <thead>
                <tr>
                    <th style="display:none;"></th>
                    <th class="text-center"><input class="check-all" type="checkbox"/></th>
                    <th class="text-center">Title</th>
                    <?php if($parentId==0){ ?>
                    <th class="text-center">Sub category</th>
                    <?php }?>
                    <th class="text-center"><?php echo $GLOBALS['basic']['action']; ?></th>
                </tr>
                </thead>

                <tbody>
                <?php $records = category::find_all_byparnt($parentId);
                foreach ($records as $key => $record): ?>
                    <tr id="<?php echo $record->id; ?>">
                        <td style="display:none;"><?php echo $key + 1; ?></td>
                        <td><input type="checkbox" class="bulkCheckbox" bulkId="<?php echo $record->id; ?>"/></td>
                        <td><?php echo $record->title; ?></td>
                        <?php if($parentId==0){ ?>
                        <td class="text-center">
                            <?php $countChild = category::getTotalChild($record->id);
                            if ($countChild) { ?>
                                <a class="primary-bg medium btn loadingbar-demo"
                                   title="" <?php echo ($countChild) ? 'onClick="viewChildlist(' . $record->id . ');"' : ''; ?>
                                   href="javascript:void(0);">
                                    <span class="button-content">
                                        <span class="badge bg-orange radius-all-4 mrg5R" title=""
                                              data-original-title="Badge with tooltip"><?php echo $countChild; ?></span>
                                        <span class="text-transform-upr font-bold font-size-11">View Lists</span>
                                    </span>
                                </a>
                            <?php } else {
                                echo 'N/A';
                            } ?>
                        </td>
                        <?php }?>
                        <td class="text-center">
                            <?php
                            $statusImage = ($record->status == 1) ? "bg-green" : "bg-red";
                            $statusText = ($record->status == 1) ? $GLOBALS['basic']['clickUnpub'] : $GLOBALS['basic']['clickPub'];
                            ?>
                            <a href="javascript:void(0);"
                               class="btn small <?php echo $statusImage; ?> tooltip-button statusToggler"
                               data-placement="top" title="<?php echo $statusText; ?>"
                               status="<?php echo $record->status; ?>" id="imgHolder_<?php echo $record->id; ?>"
                               moduleId="<?php echo $record->id; ?>">
                                <i class="glyph-icon icon-flag"></i>
                            </a>
                            <a href="javascript:void(0);" class="loadingbar-demo btn small bg-blue-alt tooltip-button"
                               data-placement="top" title="Edit" onclick="editRecord(<?php echo $record->id; ?>);">
                                <i class="glyph-icon icon-edit"></i>
                            </a>
                            <a href="javascript:void(0);" class="btn small bg-red tooltip-button" data-placement="top"
                               title="Remove" onclick="recordDelete(<?php echo $record->id; ?>);">
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
                <option value="delete"><?php echo $GLOBALS['basic']['delete']; ?></option>
                <option value="toggleStatus"><?php echo $GLOBALS['basic']['toggleStatus']; ?></option>
            </select>
        </div>
        <a class="btn medium primary-bg" href="javascript:void(0);" id="applySelected_btn">
            <span class="glyph-icon icon-separator float-right"><i class="glyph-icon icon-cog"></i></span>
            <span class="button-content"> Click </span>
        </a>
    </div>

<?php elseif (isset($_GET['mode']) && $_GET['mode'] == "addEdit"):
    if (isset($_GET['id']) && !empty($_GET['id'])):
        $categoryId = addslashes($_REQUEST['id']);
        $categoryInfo = category::find_by_id($categoryId);
        $type_product = ($categoryInfo->type == 1) ? "checked" : " ";
        $type_package = ($categoryInfo->type == 2) ? "checked" : " ";
        $discount_yes = ($categoryInfo->discount == 1) ? "checked" : " ";
        $discount_no = ($categoryInfo->discount == 0) ? "checked" : " ";
        $type_hide = ($categoryInfo->parentId == 0) ? '' : 'hide';
        $status = ($categoryInfo->status == 1) ? "checked" : " ";
        $unstatus = ($categoryInfo->status == 0) ? "checked" : " ";
    endif;
    ?>
    <h3>
        <?php echo (isset($_GET['id'])) ? 'Edit category' : 'Add category'; ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="viewcategorylist(<?php echo !empty($categoryInfo->parentId) ? $categoryInfo->parentId : 0; ?>);">
            <span class="glyph-icon icon-separator"><i class="glyph-icon icon-arrow-circle-left"></i></span>
            <span class="button-content"> Back </span>
        </a>
    </h3>

    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <form action="" class="col-md-12 center-margin" id="category_frm">
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Parent :
                        </label>
                    </div>
                    <div class="form-input col-md-4">
                        <?php $Parentview = !empty($categoryInfo->parentId) ? $categoryInfo->parentId : 0;
                        echo category::get_parentList_bylevel(1, $Parentview); ?>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Title :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <input placeholder="category Title" class="col-md-8 validate[required,length[0,50]]" type="text"
                               name="title" id="title"
                               value="<?php echo !empty($categoryInfo->title) ? htmlentities($categoryInfo->title) : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Discount :
                        </label>
                    </div>
                    <div class="form-checkbox-radio col-md-9">
                        <input type="radio" class="custom-radio" name="discount" id="checkdis1"
                               value="1" <?php echo !empty($discount_yes) ? $discount_yes : ""; ?>>
                        <label for="">Yes</label>
                        <input type="radio" class="custom-radio" name="discount" id="checkdis2"
                               value="0" <?php echo !empty($discount_no) ? $discount_no : "checked"; ?>>
                        <label for="">No</label>
                    </div>
                </div>


                <div class="form-row rowType <?php echo !empty($type_hide) ? $type_hide : ''; ?>">
                    <div class="form-label col-md-2">
                        <label for="">
                            Type :
                        </label>
                    </div>
                    <div class="form-checkbox-radio col-md-9">
                        <input type="radio" class="custom-radio" name="type" id="checktype1"
                               value="1" <?php echo !empty($type_product) ? $type_product : "checked"; ?>>
                        <label for="">Product</label>
                        <input type="radio" class="custom-radio" name="type" id="checktype2"
                               value="2" <?php echo !empty($type_package) ? $type_package : ""; ?>>
                        <label for="">Package</label>
                    </div>
                </div>

                <!-- <div class="form-row add-image">
                    <div class="form-label col-md-2">
                        <label for="">
                            Image :
                        </label>
                    </div>

                    <?php if (!empty($categoryInfo->image)): ?>
                        <div class="col-md-3" id="removeSavedimg<?php echo $categoryInfo->id; ?>">
                            <div class="infobox info-bg">
                                <div class="button-group" data-toggle="buttons">
                            <span class="float-left">
                                <?php
                                if (file_exists(SITE_ROOT . "images/category/" . $categoryInfo->image)):
                                    $filesize = filesize(SITE_ROOT . "images/category/" . $categoryInfo->image);
                                    echo 'Size : ' . getFileFormattedSize($filesize);
                                endif;
                                ?>
                            </span>
                                    <a class="btn small float-right" href="javascript:void(0);"
                                       onclick="deleteSavedcategoryimage(<?php echo $categoryInfo->id; ?>);">
                                        <i class="glyph-icon icon-trash-o"></i>
                                    </a>
                                </div>
                                <img src="<?php echo IMAGE_PATH . 'category/thumbnails/' . $categoryInfo->image; ?>"
                                     style="width:100%"/>
                            </div>
                        </div>
                    <?php endif; ?>
                    <div class="form-input col-md-10 uploader <?php echo !empty($categoryInfo->image) ? "hide" : ""; ?>">
                        <input type="file" name="category_upload" id="category_upload" class="transparent no-shadow">
                    </div> -->
                    <!-- Upload user image preview -->
                    <!-- <div id="preview_Image"><input type="hidden" name="imageArrayname"
                                                   value="<?php echo !empty($categoryInfo->image) ? $categoryInfo->image : ""; ?>"
                                                   class=""/></div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Icon :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <input placeholder="fa fa-coffee" class="col-md-8" type="text" name="icon" id="icon"
                               value="<?php echo !empty($categoryInfo->icon) ? $categoryInfo->icon : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-8">
                        <label for="">
                            Brief :
                        </label>
                        <textarea name="brief" id="brief"
                                  class="large-textarea validate[required]"><?php echo !empty($categoryInfo->brief) ? $categoryInfo->brief : ""; ?></textarea>
                    </div>
                </div> -->

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

                <button btn-action='0' type="submit" name="submit"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4"
                        id="btn-submit" title="Save">
                <span class="button-content">
                    Save
                </span>
                </button>
                <button btn-action='1' type="submit" name="submit"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4"
                        id="btn-submit" title="Save">
                <span class="button-content">
                    Save & More
                </span>
                </button>
                <button btn-action='2' type="submit" name="submit"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4"
                        id="btn-submit" title="Save">
                <span class="button-content">
                    Save & quit
                </span>
                </button>
                <input myaction='0' type="hidden" name="idValue" id="idValue"
                       value="<?php echo !empty($categoryInfo->id) ? $categoryInfo->id : 0; ?>"/>
            </form>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            var base_url = "<?php echo ASSETS_PATH; ?>";
            CKEDITOR.replace('brief', {
                toolbar:
                    [
                        {
                            name: 'document',
                            items: ['Source', '-', 'Save', 'NewPage', 'DocProps', 'Preview', 'Print', '-', 'Templates']
                        },
                        {name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize']}, '/',
                        {name: 'colors', items: ['TextColor', 'BGColor']},
                        {name: 'tools', items: ['Maximize', 'ShowBlocks', '-', 'About']}
                    ]
            });
        });
    </script>
    <script type="text/javascript" src="<?php echo ASSETS_PATH; ?>uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript">
        // <![CDATA[
        $(document).ready(function () {
            $('#category_upload').uploadify({
                'swf': '<?php echo ASSETS_PATH;?>uploadify/uploadify.swf',
                'uploader': '<?php echo ASSETS_PATH;?>uploadify/uploadify.php',
                'formData': {
                    PROJECT: '<?php echo SITE_FOLDER;?>',
                    targetFolder: 'images/category/',
                    thumb_width: 200,
                    thumb_height: 200
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
                    $.post('<?php echo BASE_URL;?>apanel/category/uploaded_image.php', {imagefile: filename}, function (msg) {
                        $('#preview_Image').html(msg).show();
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

<?php endif; ?>