<link href="<?php echo ASSETS_PATH; ?>uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
<?php
$moduleTablename = "tbl_configs"; // Database table name
$moduleId = 12;                // module id >>>>> tbl_modules
$moduleFoldername = "";        // Image folder name

?>
<h3>Office Location Management</h3>
<?php $locationRow = Config::find_by_id(1);
$status = ($locationRow->location_type == 1) ? "checked" : " ";
$unstatus = ($locationRow->location_type == 0) ? "checked" : " "; ?>
<div class="my-msg"></div>
<div class="example-box">
    <div class="example-code">
        <form action="" class="col-md-12 center-margin" id="location_frm">

            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Fiscal Address :
                    </label>
                </div>
                <div class="form-input col-md-20">
                    <input placeholder="Fiscal Address" class="col-md-6" type="text" name="fiscal_address"
                           id="fiscal_address"
                           value="<?php echo !empty($locationRow->fiscal_address) ? $locationRow->fiscal_address : ""; ?>">
                </div>
            </div>
            <!--<div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Fiscal Address (Greek) :
                    </label>
                </div>
                <div class="form-input col-md-20">
                    <input placeholder="Fiscal Address (Greek)" class="col-md-6" type="text" name="fiscal_address_greek"
                           id="fiscal_address_greek"
                           value="<?php echo !empty($locationRow->fiscal_address_greek) ? $locationRow->fiscal_address_greek : ""; ?>">
                </div>
            </div>-->

            <!--
            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Address :
                    </label>
                </div>
                <div class="form-input col-md-20">
                    <input placeholder="Mail Address" class="col-md-6" type="text" name="mail_address" id="mail_address"
                           value="<?php echo !empty($locationRow->mail_address) ? $locationRow->mail_address : ""; ?>">
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Address (Greek) :
                    </label>
                </div>
                <div class="form-input col-md-20">
                    <input placeholder="Address (Greek)" class="col-md-6" type="text" name="fax" id="fax"
                           value="<?php echo !empty($locationRow->fax) ? $locationRow->fax : ""; ?>">
                </div>
            </div>
            -->

            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Contact Info :
                    </label>
                </div>
                <div class="form-input col-md-20">
                    <input placeholder="Contact Info" class="col-md-6" type="text" name="contact_info" id="contact_info"
                           value="<?php echo !empty($locationRow->contact_info) ? $locationRow->contact_info : ""; ?>">
                </div>
            </div>

            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Email Address :
                    </label>
                </div>
                <div class="form-input col-md-20">
                    <input placeholder="Email Address" class="col-md-6" type="text" name="email_address"
                           id="email_address"
                           value="<?php echo !empty($locationRow->email_address) ? $locationRow->email_address : ""; ?>">
                </div>
            </div>

            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Google Map Link :
                    </label>
                </div>
                <div class="form-input col-md-20">
                    <input placeholder="Google Map Link" class="col-md-6" type="text" name="mail_address"
                           id="mail_address"
                           value="<?php echo !empty($locationRow->mail_address) ? $locationRow->mail_address : ""; ?>">
                </div>
            </div>

            <!--<div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Type :
                    </label>
                </div>
                <div class="form-checkbox-radio col-md-9">
                    <input type="radio" class="custom-radio addtype" name="location_type" id="check1"
                           value="1" <?php echo !empty($status) ? $status : "checked"; ?>>
                    <label for="">Google Map</label>
                    <input type="radio" class="custom-radio addtype" name="location_type" id="check0"
                           value="0" <?php echo !empty($unstatus) ? $unstatus : ""; ?>>
                    <label for="">Image</label>
                </div>
            </div>

            <div class="form-row <?php echo ($locationRow->location_type == 0) ? 'hide' : ''; ?> google-link">
                <div class="form-label col-md-2">
                    <label for="">
                        Link :
                    </label>
                </div>
                <div class="form-input col-md-4">
                    <textarea name="location_map" id="location_map"
                              class="large-textarea validate[required]"><?php echo !empty($locationRow->location_map) ? $locationRow->location_map : ""; ?></textarea>
                </div>
            </div>

            <div class="form-row <?php echo ($locationRow->location_type == 1) ? 'hide' : ''; ?> image-link">
                <div class="form-label col-md-2">
                    <label for="">
                        Image :
                    </label>
                </div>

                <?php if (!empty($locationRow->location_image)): ?>
                    <div class="col-md-4" id="removeSavedimg1">
                        <div class="infobox info-bg">
                            <div class="button-group" data-toggle="buttons">
                            <span class="float-left">
                                <?php
                                if (file_exists(SITE_ROOT . "images/preference/locimage/" . $locationRow->location_image)):
                                    $filesize = filesize(SITE_ROOT . "images/preference/locimage/" . $locationRow->location_image);
                                    echo 'Size : ' . getFileFormattedSize($filesize);
                                endif;
                                ?>
                            </span>
                                <a class="btn small float-right" href="javascript:void(0);"
                                   onclick="deleteSavedPreferenceimage(1);">
                                    <i class="glyph-icon icon-trash-o"></i>
                                </a>
                            </div>
                            <img src="<?php echo IMAGE_PATH . 'preference/locimage/thumbnails/' . $locationRow->location_image; ?>"
                                 style="width:100%"/>
                            <input type="hidden" name="imageArrayname" value="<?= $locationRow->location_image ?>" class=""/>
                        </div>
                    </div>
                <?php endif; ?>
                <div class="form-input col-md-10 uploader1 <?php echo !empty($locationRow->location_image) ? "hide" : ""; ?>">
                    <input type="file" name="location_image" id="location_image" class="transparent no-shadow">
                </div>-->
               <!--  Upload user image preview 
              <!--  <div id="preview_Image"></div>
            </div>
            -->

            <div class="form-row">
                <div class="form-label col-md-12">
                    <label for="">
                        Brief :
                    </label>
                    <textarea name="breif" id="breif" class="large-textarea"><?php echo !empty($locationRow->breif) ? $locationRow->breif : ""; ?></textarea>
                </div>
            </div>
            <!--<div class="form-row">
                <div class="form-label col-md-12">
                    <label for="">
                        Brief (Greek):
                    </label>
                    <textarea name="brief_greek" id="brief_greek"
                              class="large-textarea"><?php echo !empty($locationRow->brief_greek) ? $locationRow->brief_greek : ""; ?></textarea>
                </div>
            </div>-->
            <!--<div class="form-row">
                <div class="form-label col-md-12">
                    <label for="">
                        Opening Hour:
                    </label>
                    <textarea name="opening_hour" id="opening_hour" class="large-textarea"><?php echo !empty($locationRow->opening_hour) ? $locationRow->opening_hour : ""; ?></textarea>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label col-md-12">
                    <label for="">
                        Opening Hour (Greek):
                    </label>
                    <textarea name="opening_hour_greek" id="opening_hour_greek" class="large-textarea"><?php echo !empty($locationRow->opening_hour_greek) ? $locationRow->opening_hour_greek : ""; ?></textarea>
                </div>
            </div>-->

            <button type="submit" name="submit"
                    class="btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4" id="btn-submit"
                    title="Save">
                <span class="button-content">
                    Save
                </span>
            </button>
            <input type="hidden" name="idValue" id="idValue"
                   value="<?php echo !empty($locationRow->id) ? $locationRow->id : 0; ?>"/>
        </form>
    </div>
</div>
<script>
    var base_url = "<?php echo ASSETS_PATH; ?>";
    var editor_arr = ["breif"];
    create_editor(base_url, editor_arr);
</script>
<script type="text/javascript" src="<?php echo ASSETS_PATH; ?>uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript">
    // <![CDATA[
    $(document).ready(function () {
        // For Icon Image Upload
        $('#location_image').uploadify({
            'swf': '<?php echo ASSETS_PATH;?>uploadify/uploadify.swf',
            'uploader': '<?php echo ASSETS_PATH;?>uploadify/uploadify.php',
            'formData': {
                PROJECT: '<?php echo SITE_FOLDER;?>',
                targetFolder: 'images/preference/locimage/',
                thumb_width: 300,
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
            'uploadLimit': 5,
            'fileTypeExts': '*.gif; *.jpg; *.jpeg;  *.png; *.GIF; *.JPG; *.JPEG; *.PNG;',
            'buttonClass': 'button formButtons',
            /* 'checkExisting' : '/uploadify/check-exists.php',*/
            'onUploadSuccess': function (file, data, response) {
                $('#uploadedImageName').val('1');
                var filename = data;
                $.post('<?php echo BASE_URL;?>apanel/location/uploaded_image.php', {imagefile: filename}, function (msg) {
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

    $(document).ready(function () {
        /************************************ Editor for message *****************************************/
        var base_url = "<?php // echo ASSETS_PATH;
            ?>";
        CKEDITOR.replace('brief_greek', {
            toolbar:
                [
                    {name: 'document', items: ['Source', '-', 'Save', 'NewPage', 'DocProps', 'Preview', 'Print', '-', 'Templates']},
                    {name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize']}, '/',
                    {name: 'colors', items: ['TextColor', 'BGColor']},
                    {name: 'tools', items: ['Maximize', 'ShowBlocks', '-', 'About']}
                ]
        });
        /* CKEDITOR.replace( 'opening_hour',{
                 toolbar :
                 [
                     { name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
                     { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },'/',
                     { name: 'colors', items : [ 'TextColor','BGColor' ] },
                     { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
                 ]
             });
         CKEDITOR.replace( 'opening_hour_greek',{
                 toolbar :
                 [
                     { name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
                     { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },'/',
                     { name: 'colors', items : [ 'TextColor','BGColor' ] },
                     { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
                 ]
             });*/


    });
</script>
