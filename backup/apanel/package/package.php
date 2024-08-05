<link href="<?php echo ASSETS_PATH; ?>uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
<?php
$moduleTablename = "tbl_package"; // Database table name
$moduleId = 7;                // module id >>>>> tbl_modules
$moduleFoldername = "";        // Image folder name

if (isset($_GET['page']) && $_GET['page'] == "package" && isset($_GET['mode']) && $_GET['mode'] == "list"):
    clearImages($moduleTablename, "package");
    clearImages($moduleTablename, "package/thumbnails");

    clearImages($moduleTablename, "package/listimage", "list_image");
    clearImages($moduleTablename, "package/listimage/thumbnails", "list_image");

//    SerclearImages($moduleTablename, "package/banner", "banner_image");
//    SerclearImages($moduleTablename, "package/banner/thumbnails", "banner_image");
    ?>
    <h3>
        List Packages
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="AddNewPackage();">
    <span class="glyph-icon icon-separator">
    	<i class="glyph-icon icon-plus-square"></i>
    </span>
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
                    <!--<th>Title(Greek)</th>-->
                    <th>Sub Package</th>
                    <th class="text-center"><?php echo $GLOBALS['basic']['action']; ?></th>
                </tr>
                </thead>

                <tbody>
                <?php $records = Package::find_all();
                foreach ($records as $key => $record): ?>
                    <tr id="<?php echo $record->id; ?>">
                        <td style="display:none;"><?php echo $key + 1; ?></td>
                        <td><input type="checkbox" class="bulkCheckbox" bulkId="<?php echo $record->id; ?>"/></td>
                        <td>
                            <a href="javascript:void(0);" title="" class="user-ico clearfix"
                               onclick="editRecord(<?php echo $record->id; ?>);">
                                <span><?php echo $record->title; ?></span>
                            </a>
                        </td>
                        <!--<td><?php echo $record->title_greek; ?></td>-->
                        <td>
                            <a class="primary-bg medium btn loadingbar-demo" title=""
                               onClick="viewSubpackagelist(<?php echo $record->id; ?>);" href="javascript:void(0);">
                                <span class="button-content">
                                    <span class="badge bg-orange radius-all-4 mrg5R" title=""
                                          data-original-title="Badge with tooltip"><?php echo $countImages = Subpackage::getTotalSub($record->id); ?></span>
                                    <span class="text-transform-upr font-bold font-size-11">View Lists</span>
                                </span>
                            </a>
                        </td>
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
    <span class="glyph-icon icon-separator float-right">
      <i class="glyph-icon icon-cog"></i>
    </span>
            <span class="button-content"> Click </span>
        </a>
    </div>

<?php elseif (isset($_GET['mode']) && $_GET['mode'] == "addEdit"):
    if (isset($_GET['id']) && !empty($_GET['id'])):
        $packageId = addslashes($_REQUEST['id']);
        $packageInfo = Package::find_by_id($packageId);
        $status = ($packageInfo->status == 1) ? "checked" : " ";
        $unstatus = ($packageInfo->status == 0) ? "checked" : " ";
        $homepage = ($packageInfo->homepage == 1) ? "checked" : " ";
        $nothomepage = ($packageInfo->homepage == 0) ? "checked" : " ";
    endif;
    ?>
    <h3>
        <?php echo (isset($_GET['id'])) ? 'Edit Package' : 'Add Package'; ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="viewPackagelist();">
            <span class="glyph-icon icon-separator">
                <i class="glyph-icon icon-arrow-circle-left"></i>
            </span>
            <span class="button-content"> Back </span>
        </a>
    </h3>

    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <form action="" class="col-md-12 center-margin" id="package_frm">
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Title :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Package Title" class="col-md-6 validate[required,length[0,200]]" type="text"
                               name="title" id="title"
                               value="<?php echo !empty($packageInfo->title) ? $packageInfo->title : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">Slug :</label>
                    </div>
                    <div class="form-input col-md-20">
                        <?php echo BASE_URL; ?><input placeholder="Slug" class="col-md-3 validate[required,length[0,200]]" type="text" name="slug"
                                                      id="slug" value="<?php echo !empty($packageInfo->slug) ? $packageInfo->slug : ""; ?>">
                        <span id="error"></span>
                    </div>
                </div>

                <!--<div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="" class="row">
                            Title (Greek):
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Title Greek" class="col-md-6" type="text" name="title_greek" id="title_greek"
                               value="<?php echo !empty($packageInfo->title_greek) ? $packageInfo->title_greek : "";
                               ?>">
                    </div>
                </div>-->

                <!--<div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Sub Title :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Sub Title" class="col-md-6 validate[required,length[0,200]]" type="text" name="sub_title" id="sub_title"
                               value="<?php echo !empty($packageInfo->sub_title) ? $packageInfo->sub_title : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Sub Title (Greek) :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Sub Title (Greek)" class="col-md-6" type="text" name="sub_title_greek" id="sub_title_greek"
                               value="<?php echo !empty($packageInfo->sub_title_greek) ? $packageInfo->sub_title_greek : ""; ?>">
                    </div>
                </div>-->

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Banner Image :
                        </label>
                    </div>
                    <div class="form-input col-md-10 uploader2 <?php echo !empty($packageInfo->image) ? "hide" : ""; ?>">
                        <input type="file" name="image" id="package_upload" class="transparent no-shadow">
                        <label>
                            <small>Image Dimensions (1520 px X 320 px)</small>
                        </label>
                    </div>
                    <!-- Upload user image preview -->
                    <div id="preview_Image"></div>
                    <?php if (!empty($packageInfo->image)): ?>
                        <div class="col-md-3" id="removeSavedimg2<?php echo $packageInfo->id; ?>">
                            <div class="infobox info-bg">
                                <div class="button-group" data-toggle="buttons">
                                <span class="float-left">
                                    <?php
                                    if (file_exists(SITE_ROOT . "images/package/" . $packageInfo->image)):
                                        $filesize = filesize(SITE_ROOT . "images/package/" . $packageInfo->image);
                                        echo 'Size : ' . getFileFormattedSize($filesize);
                                    endif;
                                    ?>
                                </span>
                                    <a class="btn small float-right" href="javascript:void(0);"
                                       onclick="deleteSavedPackageBimage(<?php echo $packageInfo->id; ?>);">
                                        <i class="glyph-icon icon-trash-o"></i>
                                    </a>
                                </div>
                                <img src="<?php echo IMAGE_PATH . 'package/thumbnails/' . $packageInfo->image; ?>" style="width:100%"/>
                                <input type="hidden" name="imageArrayname" value="" class=""/>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            List Image :
                        </label>
                    </div>
                    <div class="form-input col-md-10 uploader1 <?php echo !empty($packageInfo->list_image) ? "hide" : ""; ?>">
                        <input type="file" name="list_image" id="package_list_upload" class="transparent no-shadow">
                        <label>
                            <small>Image Dimensions (670 px X 380 px)</small>
                        </label>
                    </div>
                    <!-- Upload user image preview -->
                    <div id="preview_Image3"></div>

                    <?php if (!empty($packageInfo->list_image)): ?>
                        <div class="col-md-3" id="removeSavedimg1<?php echo $packageInfo->id; ?>">
                            <div class="infobox info-bg">
                                <div class="button-group" data-toggle="buttons">
                                <span class="float-left">
                                    <?php
                                    if (file_exists(SITE_ROOT . "images/package/listimage/" . $packageInfo->list_image)):
                                        $filesize = filesize(SITE_ROOT . "images/package/listimage/" . $packageInfo->list_image);
                                        echo 'Size : ' . getFileFormattedSize($filesize);
                                    endif;
                                    ?>
                                </span>
                                    <a class="btn small float-right" href="javascript:void(0);"
                                       onclick="deleteSavedPackageLimage(<?php echo $packageInfo->id; ?>);">
                                        <i class="glyph-icon icon-trash-o"></i>
                                    </a>
                                </div>
                                <img src="<?php echo IMAGE_PATH . 'package/listimage/thumbnails/' . $packageInfo->list_image; ?>" style="width:100%"/>
                                <input type="hidden" name="imageArrayname3" value="" class=""/>
                            </div>
                        </div>
                    <?php endif; ?>

                </div>

                <!--<div class="form-row add-image">
                    <div class="form-label col-md-2">
                        <label for="">
                            Detail Image :
                        </label>
                    </div>
                    <div class="form-input col-md-10 uploader3 <?php echo !empty($packageInfo->banner_image) ? "hide" : ""; ?>">
                        <input type="file" name="banner_upload" id="banner_upload" class="transparent no-shadow">
                        <label>
                            <small>Image Dimensions (1500 px X 850 px)</small>
                        </label>
                    </div>
                    <div id="preview_banner"></div>
                </div>

                <div class="form-row">
                    <?php
                if (!empty($packageInfo->banner_image)):
                    $imageRec = unserialize($packageInfo->banner_image);
                    if ($imageRec):
                        foreach ($imageRec as $k => $imageRow): ?>
                                <div class="col-md-3" id="removeSavedimg3<?php echo $k; ?>">
                                    <div class="infobox info-bg">
                                        <div class="button-group" data-toggle="buttons">
                                    <span class="float-left">
                                        <?php
                            if (file_exists(SITE_ROOT . "images/package/banner/" . $imageRow)):
                                $filesize = filesize(SITE_ROOT . "images/package/banner/" . $imageRow);
                                echo 'Size : ' . getFileFormattedSize($filesize);
                            endif;
                            ?>
                                    </span>
                                            <a class="btn small float-right" href="javascript:void(0);"
                                               onclick="deleteSavedPackageimage(<?php echo $k; ?>);">
                                                <i class="glyph-icon icon-trash-o"></i>
                                            </a>
                                        </div>
                                        <img src="<?php echo IMAGE_PATH . 'package/banner/thumbnails/' . $imageRow; ?>"
                                             style="width:100%"/>
                                        <input type="hidden" name="imageArrayname2[]" value="<?php echo $imageRow; ?>"/>

                                    </div>
                                </div>
                            <?php endforeach;
                    endif;
                endif; ?>
                </div>-->

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Brief :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                <textarea placeholder="Brief" class="col-md-6 validate[length[0,200]]" type="text" name="detail"
                          id="detail"><?php echo !empty($packageInfo->detail) ? $packageInfo->detail : ""; ?></textarea>
                    </div>
                </div>

                <!--<div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Brief (Greek) :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                <textarea placeholder="Brief (Greek)" class="col-md-6" type="text" name="brief_greek"
                          id="brief_greek"><?php echo !empty($packageInfo->brief_greek) ? $packageInfo->brief_greek : ""; ?></textarea>
                    </div>
                </div>-->

                <div class="form-row">
                    <div class="form-label col-md-12">
                        <label for="">
                            Content :
                        </label>
                <textarea name="content" id="content"
                          class="large-textarea validate[required]"><?php echo !empty($packageInfo->content) ? $packageInfo->content : ""; ?></textarea>
                        <a class="btn medium bg-orange mrg5T hide" title="Read More" id="readMore"
                           href="javascript:void(0);">
                            <span class="button-content">Read More</span>
                        </a>
                    </div>
                </div>

                <!--<div class="form-row">
                    <div class="form-label col-md-12">
                        <label for="">
                            Content (Greek):
                        </label>
                <textarea name="content_greek" id="content_greek"
                          class="large-textarea"><?php echo !empty($packageInfo->content_greek) ? $packageInfo->content_greek : ""; ?></textarea>
                        <a class="btn medium bg-orange mrg5T hide" title="Read More" id="readMore"
                           href="javascript:void(0);">
                            <span class="button-content">Read More</span>
                        </a>
                    </div>
                </div>-->
                <!--<div class="form-row">
                    <div class="form-label col-md-12">
                        <label for="">
                            Procedures :
                        </label>
                <textarea name="procedures" id="procedures"
                          class="large-textarea"><?php echo !empty($packageInfo->procedures) ? $packageInfo->procedures : ""; ?></textarea>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-12">
                        <label for="">
                            Procedure (Greek):
                        </label>
                <textarea name="procedure_greek" id="procedure_greek"
                          class="large-textarea"><?php echo !empty($packageInfo->procedure_greek) ? $packageInfo->procedure_greek : ""; ?></textarea>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-12">
                        <label for="">
                            Test preparation :
                        </label>
                <textarea name="test_preparation" id="test_preparation"
                          class="large-textarea"><?php echo !empty($packageInfo->test_preparation) ? $packageInfo->test_preparation : ""; ?></textarea>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-12">
                        <label for="">
                            Test preparation (Greek):
                        </label>
                <textarea name="test_preparation_greek" id="test_preparation_greek"
                          class="large-textarea"><?php echo !empty($packageInfo->test_preparation_greek) ? $packageInfo->test_preparation_greek : ""; ?></textarea>
                    </div>
                </div>-->

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Display on Home :
                        </label>
                    </div>
                    <div class="form-checkbox-radio col-md-9">
                        <input type="radio" class="custom-radio" name="homepage" id="check1"
                               value="1" <?php echo !empty($homepage) ? $homepage : ""; ?>>
                        <label for="">Yes</label>
                        <input type="radio" class="custom-radio" name="homepage" id="check0"
                               value="0" <?php echo !empty($nothomepage) ? $nothomepage : "checked"; ?>>
                        <label for="">No</label>
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
                               value="1" <?php echo !empty($status) ? $status : " checked"; ?>>
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
                <div class="form-row <?php echo (!empty($packageInfo->meta_keywords) || !empty($packageInfo->meta_description) || !empty($packageInfo->meta_title)) ? '' : 'hide'; ?> metadata">
                    <div class="col-md-12">
                        <div class="form-input col-md-12">
                            <input placeholder="Meta Title" class="col-md-6 validate[required]" type="text"
                                   name="meta_title" id="meta_title"
                                   value="<?php echo !empty($packageInfo->meta_title) ? $packageInfo->meta_title : ""; ?>">
                        </div>
                        <br/>
                        <div class="form-input col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <textarea placeholder="Meta Keyword" name="meta_keywords" id="meta_keywords"
                                              class="character-keyword validate[required]"><?php echo !empty($packageInfo->meta_keywords) ? $packageInfo->meta_keywords : ""; ?></textarea>
                                    <div class="keyword-remaining clear input-description">250 characters left</div>
                                </div>
                                <div class="col-md-6">
                            <textarea placeholder="Meta Description" name="meta_description" id="meta_description"
                                      class="character-description validate[required]"><?php echo !empty($packageInfo->meta_description) ? $packageInfo->meta_description : ""; ?></textarea>
                                    <div class="description-remaining clear input-description">160 characters left</div>
                                </div>
                                <!--<div class="col-md-4">
                            <textarea placeholder="Meta Title Greek" name="meta_title_greek" id="meta_title_greek"
                                      class="character-keyword"><?php echo !empty($packageInfo->meta_title_greek) ? $packageInfo->meta_title_greek : ""; ?></textarea>
                                </div>
                                <div class="col-md-4">
                            <textarea placeholder="Meta Keywords Greek" name="meta_keywords_greek" id="meta_keywords_greek"
                                      class="character-keyword-gr"><?php echo !empty($packageInfo->meta_keywords_greek) ? $packageInfo->meta_keywords_greek : ""; ?></textarea>
                                    <div class="keyword-remaining-gr clear input-description">250 characters left</div>
                                </div>
                                <div class="col-md-4">
                            <textarea placeholder="Meta Keywords Greek" name="meta_description_greek" id="meta_description_greek"
                                      class="character-description-gr"><?php echo !empty($packageInfo->meta_description_greek) ? $packageInfo->meta_description_greek : ""; ?></textarea>
                                    <div class="description-remaining-gr clear input-description">160 characters left</div>
                                </div>-->
                            </div>
                        </div>
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
                       value="<?php echo !empty($packageInfo->id) ? $packageInfo->id : 0; ?>"/>
            </form>
        </div>
    </div>

    <script>
        var base_url = "<?php echo ASSETS_PATH; ?>";
        // var editor_arr = ["content", "procedures", "test_preparation", "content_greek", "procedure_greek", "test_preparation_greek"];
        var editor_arr = ["content"];
        create_editor(base_url, editor_arr);
    </script>
    <script type="text/javascript" src="<?php echo ASSETS_PATH; ?>uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript">
        // <![CDATA[
        $(document).ready(function () {
            $('#package_upload').uploadify({
                'swf': '<?php echo ASSETS_PATH;?>uploadify/uploadify.swf',
                'uploader': '<?php echo ASSETS_PATH;?>uploadify/uploadify.php',
                'formData': {
                    PROJECT: '<?php echo SITE_FOLDER;?>',
                    targetFolder: 'images/package/',
                    thumb_width: 200,
                    thumb_height: 200
                },
                'method': 'post',
                'cancelImg': '<?php echo BASE_URL;?>uploadify/cancel.png',
                'auto': true,
                'multi': true,
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
                    $.post('<?php echo BASE_URL;?>apanel/package/uploaded_image.php', {imagefile: filename}, function (msg) {
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

            $('#package_list_upload').uploadify({
                'swf': '<?php echo ASSETS_PATH;?>uploadify/uploadify.swf',
                'uploader': '<?php echo ASSETS_PATH;?>uploadify/uploadify.php',
                'formData': {
                    PROJECT: '<?php echo SITE_FOLDER;?>',
                    targetFolder: 'images/package/listimage/',
                    thumb_width: 200,
                    thumb_height: 200
                },
                'method': 'post',
                'cancelImg': '<?php echo BASE_URL;?>uploadify/cancel.png',
                'auto': true,
                'multi': true,
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
                    $.post('<?php echo BASE_URL;?>apanel/package/list_image.php', {imagefile: filename}, function (msg) {
                        $('#preview_Image3').html(msg).show();
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

            $('#banner_upload').uploadify({
                'swf': '<?php echo ASSETS_PATH;?>uploadify/uploadify.swf',
                'uploader': '<?php echo ASSETS_PATH;?>uploadify/uploadify.php',
                'formData': {
                    PROJECT: '<?php echo SITE_FOLDER;?>',
                    targetFolder: 'images/package/banner/',
                    thumb_width: 200,
                    thumb_height: 200
                },
                'method': 'post',
                'cancelImg': '<?php echo BASE_URL;?>uploadify/cancel.png',
                'auto': true,
                'multi': true,
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
                    $.post('<?php echo BASE_URL;?>apanel/package/banner_image.php', {imagefile: filename}, function (msg) {
                        $('#preview_banner').append(msg).show();
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
    <script>
        $(document).ready(function () {
            /************************************ Editor for message *****************************************/
            var base_url = "<?php // echo ASSETS_PATH;
                ?>";
            /*
            CKEDITOR.replace('procedures', {
                toolbar:
                    [
                        {name: 'document', items: ['Source', '-', 'Save', 'NewPage', 'DocProps', 'Preview', 'Print', '-', 'Templates']},
                        {name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize']}, '/',
                        {name: 'colors', items: ['TextColor', 'BGColor']},
                        {name: 'tools', items: ['Maximize', 'ShowBlocks', '-', 'About']}
                    ]
            });
            CKEDITOR.replace('test_preparation', {
                toolbar:
                    [
                        {name: 'document', items: ['Source', '-', 'Save', 'NewPage', 'DocProps', 'Preview', 'Print', '-', 'Templates']},
                        {name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize']}, '/',
                        {name: 'colors', items: ['TextColor', 'BGColor']},
                        {name: 'tools', items: ['Maximize', 'ShowBlocks', '-', 'About']}
                    ]
            });
            CKEDITOR.replace('content_greek', {
                toolbar:
                    [
                        {name: 'document', items: ['Source', '-', 'Save', 'NewPage', 'DocProps', 'Preview', 'Print', '-', 'Templates']},
                        {name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize']}, '/',
                        {name: 'colors', items: ['TextColor', 'BGColor']},
                        {name: 'tools', items: ['Maximize', 'ShowBlocks', '-', 'About']}
                    ]
            });
            CKEDITOR.replace('procedure_greek', {
                toolbar:
                    [
                        {name: 'document', items: ['Source', '-', 'Save', 'NewPage', 'DocProps', 'Preview', 'Print', '-', 'Templates']},
                        {name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize']}, '/',
                        {name: 'colors', items: ['TextColor', 'BGColor']},
                        {name: 'tools', items: ['Maximize', 'ShowBlocks', '-', 'About']}
                    ]
            });
            CKEDITOR.replace('test_preparation_greek', {
                toolbar:
                    [
                        {name: 'document', items: ['Source', '-', 'Save', 'NewPage', 'DocProps', 'Preview', 'Print', '-', 'Templates']},
                        {name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize']}, '/',
                        {name: 'colors', items: ['TextColor', 'BGColor']},
                        {name: 'tools', items: ['Maximize', 'ShowBlocks', '-', 'About']}
                    ]
            });
            */
        });
    </script>
<?php endif;
include("sub_package.php");
include("sub_sub_package.php"); ?>