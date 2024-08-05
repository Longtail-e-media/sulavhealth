<link href="<?php echo ASSETS_PATH; ?>uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
<?php
$moduleTablename = "tbl_location"; // Database table name
$moduleId = 26;                // module id >>>>> tbl_modules
$moduleFoldername = "locationn";        // Image folder name

if (isset($_GET['page']) && $_GET['page'] == "locationn" && isset($_GET['mode']) && $_GET['mode'] == "list"):
    $parentId = (isset($_REQUEST['id']) and !empty($_REQUEST['id'])) ? addslashes($_REQUEST['id']) : 0;
    ?>
    <h3>
        List locations
        <?php if (!empty($_REQUEST['id'])) { ?>
            <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
               onClick="viewlocationnList();">
                <span class="glyph-icon icon-separator"><i class="glyph-icon icon-arrow-circle-left"></i></span>
                <span class="button-content"> Back </span>
            </a>
        <?php } ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="addNewlocationn();">
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
                    <?php if ($parentId != 0) { ?>
                    <th class="text-center">Delivery Charge</th>
                    <?php } ?>
                    <!--<th>Title(Greek)</th>-->
                    <?php if ($parentId == 0) { ?>
                        <th class="text-center">Sub category</th>
                    <?php } ?>
                    <th class="text-center"><?php echo $GLOBALS['basic']['action']; ?></th>
                </tr>
                </thead>

                <tbody>
                <?php $records = locationn::find_all_byparnt($parentId);
                foreach ($records as $key => $record): ?>
                    <tr id="<?php echo $record->id; ?>">
                        <td style="display:none;"><?php echo $key + 1; ?></td>
                        <td><input type="checkbox" class="bulkCheckbox" bulkId="<?php echo $record->id; ?>"/></td>
                        <td>
                            <div class="col-md-7">
                                <a href="javascript:void(0);" onClick="editRecord(<?php echo $record->id; ?>);"
                                   class="loadingbar-demo"
                                   title="<?php echo $record->title; ?>"><?php echo $record->title; ?></a>
                            </div>
                        </td>
                        <?php if ($parentId != 0) { $dcharge= ($record->delivery_charge != 0) ? $record->delivery_charge : "N/A";?>
                        <td class="text-center"><?php echo $dcharge;?></td>
                        <?php }?>
                        <!--<td><?php echo $record->title_greek; ?></td>-->
                        <?php if ($parentId == 0) { ?>
                            <td class="text-center">
                                <?php $countChild = locationn::getTotalChild($record->id);
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
                        <?php } ?>
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
        $locationnId = addslashes($_REQUEST['id']);
        $locationnInfo = locationn::find_by_id($locationnId);
        $status = ($locationnInfo->status == 1) ? "checked" : " ";
        // $unstatus = ($locationnInfo->status == 0) ? "checked" : " ";
        // $homepage = ($locationnInfo->homepage == 1) ? "checked" : " ";
        // $nothomepage = ($locationnInfo->homepage == 0) ? "checked" : " ";
    endif;
    ?>
    <h3>
        <?php echo (isset($_GET['id'])) ? 'Edit location' : 'Add location'; ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="viewlocationnList();">
            <span class="glyph-icon icon-separator"><i class="glyph-icon icon-arrow-circle-left"></i></span>
            <span class="button-content"> Back </span>
        </a>
    </h3>

    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <form action="" class="col-md-12 center-margin" id="articles_frm">
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Parent :
                        </label>
                    </div>
                    <div class="form-input col-md-4">
                        <?php $Parentview = !empty($locationnInfo->parentId) ? $locationnInfo->parentId : 0;
                        echo locationn::get_parentList_bylevel(1, $Parentview); ?>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Title :
                        </label>
                    </div>
                    <div class="form-input col-md-10">
                        <input placeholder="Title" class="col-md-6 validate[required,length[0,200]]" type="text"
                               name="title" id="title"
                               value="<?php echo !empty($locationnInfo->title) ? $locationnInfo->title : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Delivery Charge :
                        </label>
                    </div>
                    <div class="form-input col-md-10">
                        <input placeholder="Delivery Charge" class="col-md-6 validate[required,length[0,200]]" type="number"
                               name="delivery_charge" id="delivery_charge" min="0" step="1"
                               value="<?php echo !empty($locationnInfo->delivery_charge) ? $locationnInfo->delivery_charge : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Latitude :
                        </label>
                    </div>
                    <div class="form-input col-md-10">
                        <input placeholder="Latitude" class="col-md-6 validate[required,length[0,200]]" type="text"
                               name="latitude" id="latitude"
                               value="<?php echo !empty($locationnInfo->latitude) ? $locationnInfo->latitude : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Longitude :
                        </label>
                    </div>
                    <div class="form-input col-md-10">
                        <input placeholder="Longitude" class="col-md-6 validate[required,length[0,200]]" type="text"
                               name="longitude" id="longitude"
                               value="<?php echo !empty($locationnInfo->longitude) ? $locationnInfo->longitude : ""; ?>">
                        <br><small><a href="https://www.latlong.net/" target="_blank">Get geolocation here</a></small>
                    </div>
                </div>


                <div class="form-row">
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
                <input myaction='0' type="hidden" name="idValue" id="idValue" value="<?php echo !empty($locationnInfo->id) ? $locationnInfo->id : 0; ?>"/>
            </form>
        </div>
    </div>
    <script>
        var base_url = "<?php echo ASSETS_PATH; ?>";
        var editor_arr = ["content"];
        create_editor(base_url, editor_arr);
    </script>

    <script type="text/javascript" src="<?php echo ASSETS_PATH; ?>uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript">
        // <![CDATA[
        $(document).ready(function () {
            $('#gallery_upload').uploadify({
                'swf': '<?php echo ASSETS_PATH;?>uploadify/uploadify.swf',
                'uploader': '<?php echo ASSETS_PATH;?>uploadify/uploadify.php',
                'formData': {
                    PROJECT: '<?php echo SITE_FOLDER;?>',
                    targetFolder: 'images/locationn/',
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
                    $.post('<?php echo BASE_URL;?>apanel/locationn/uploaded_image.php', {imagefile: filename}, function (msg) {
                        $('#preview_Image').append(msg).show();
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