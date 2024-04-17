<link href="<?php echo ASSETS_PATH; ?>uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
<?php
$moduleTablename = "tbl_file"; // Database table name
$moduleId = 20;                // module id >>>>> tbl_modules
if (isset($_GET['page']) && $_GET['page'] == "file" && isset($_GET['mode']) && $_GET['mode'] == "list"):
    clearImages("tbl_file", "file", "file");
    clearImages("tbl_file", "file/thumbnails", "file");
    ?>
    <h3>
        List Files
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);" onClick="addNewFile();">
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
                    <th>Title</th>
                    <th>Download</th>
                    <th class="text-center"><?php echo $GLOBALS['basic']['action']; ?></th>
                </tr>
                </thead>

                <tbody>
                <?php $records = File::find_by_sql("SELECT * FROM " . $moduleTablename . " ORDER BY sortorder DESC ");
                foreach ($records as $key => $record): ?>
                    <tr id="<?php echo $record->id; ?>">
                        <td style="display:none;"><?php echo $key + 1; ?></td>
                        <td><input type="checkbox" class="bulkCheckbox" bulkId="<?php echo $record->id; ?>"/></td>
                        <td>
                            <a href="javascript:void(0);" onClick="editRecord(<?php echo $record->id; ?>);"
                               class="loadingbar-demo" title="<?php echo $record->title; ?>">
                                <?php echo $record->title; ?>
                            </a>
                        </td>
                        <td>
                            <a href="<?php echo BASE_URL . "images/file/" . $record->file; ?>" target="_blank">
                                <?php echo BASE_URL . "images/file/" . $record->file; ?>
                            </a>
                        </td>
                        <td class="text-center">
                            <?php
                            $statusImage = ($record->status == 1) ? "bg-green" : "bg-red";
                            $statusText = ($record->status == 1) ? $GLOBALS['basic']['clickUnpub'] : $GLOBALS['basic']['clickPub'];
                            ?>
                            <a href="javascript:void(0);" class="btn small <?php echo $statusImage; ?> tooltip-button statusToggler"
                               data-placement="top" title="<?php echo $statusText; ?>" status="<?php echo $record->status; ?>"
                               id="imgHolder_<?php echo $record->id; ?>" moduleId="<?php echo $record->id; ?>">
                                <i class="glyph-icon icon-flag"></i>
                            </a>
                            <a href="javascript:void(0);" class="loadingbar-demo btn small bg-blue-alt tooltip-button" data-placement="top"
                               title="Edit" onclick="editRecord(<?php echo $record->id; ?>);">
                                <i class="glyph-icon icon-edit"></i>
                            </a>
                            <a href="javascript:void(0);" class="btn small bg-red tooltip-button" data-placement="top" title="Remove"
                               onclick="recordDelete(<?php echo $record->id; ?>);">
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
        $fileId = addslashes($_REQUEST['id']);
        $fileInfo = File::find_by_id($fileId);
        $status = ($fileInfo->status == 1) ? "checked" : " ";
        $unstatus = ($fileInfo->status == 0) ? "checked" : " ";
    endif;
    ?>
    <h3>
        <?php echo (isset($_GET['id'])) ? 'Edit File' : 'Add File'; ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);" onClick="viewFileList();">
            <span class="glyph-icon icon-separator">
                <i class="glyph-icon icon-arrow-circle-left"></i>
            </span>
            <span class="button-content"> Back </span>
        </a>
    </h3>

    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <form action="" class="col-md-12 center-margin" id="download_frm">
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Title :
                        </label>
                    </div>
                    <div class="form-input col-md-8">
                        <input placeholder="Title" class="col-md-6 validate[required,length[0,50]]" type="text" name="title" id="title"
                               value="<?php echo !empty($fileInfo->title) ? $fileInfo->title : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Upload File :
                        </label>
                    </div>

                    <?php if (!empty($fileInfo->file)): ?>
                        <div class="col-md-3" id="removeSavedimg1">
                            <div class="infobox info-bg">
                                <div class="button-group">
                                    <style>
                                        .word-break p {
                                            white-space: pre-wrap;
                                            white-space: -moz-pre-wrap;
                                            white-space: -o-pre-wrap;
                                            word-wrap: break-word;
                                        }
                                    </style>
                                    <span class="word-break">
                                        <?php
                                        if (file_exists(SITE_ROOT . "images/file/" . $fileInfo->file)):
                                            $filesize = filesize(SITE_ROOT . "images/file/" . $fileInfo->file);
                                            echo '<p><a href="' . BASE_URL . "images/file/" . $fileInfo->file . '" target="_blank">' . $fileInfo->file . '</a></p>';
                                            echo '<br> Size : ' . getFileFormattedSize($filesize);
                                        endif;
                                        ?>
                                    </span>
                                    <input type="hidden" name="imageArrayname"
                                           value="<?php echo !empty($fileInfo->file) ? $fileInfo->file : ""; ?>" class=""/>
                                    <a class="btn small float-right" href="javascript:void(0);" onclick="deleteSavedFile(1);">
                                        <i class="glyph-icon icon-trash-o"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <div class="form-input col-md-10 uploader <?php echo !empty($fileInfo->file) ? "hide" : ""; ?>">
                        <input type="file" name="background_upload" id="background_upload" class="transparent no-shadow">
                    </div>
                    <!-- Upload user image preview -->
                    <div id="preview_Image"></div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Status :
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
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4" id="btn-submit" title="Save">
                <span class="button-content">
                    Save
                </span>
                </button>
                <button btn-action='1' type="submit" name="submit"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4" id="btn-submit" title="Save">
                <span class="button-content">
                    Save & More
                </span>
                </button>
                <button btn-action='2' type="submit" name="submit"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4" id="btn-submit" title="Save">
                <span class="button-content">
                    Save & quit
                </span>
                </button>
                <input myaction='0' type="hidden" name="idValue" id="idValue"
                       value="<?php echo !empty($fileInfo->id) ? $fileInfo->id : 0; ?>"/>
            </form>
        </div>
    </div>

    <script type="text/javascript" src="<?php echo ASSETS_PATH; ?>uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript">
        // <![CDATA[
        $(document).ready(function () {
            $('#background_upload').uploadify({
                'swf': '<?php echo ASSETS_PATH;?>uploadify/uploadify.swf',
                'uploader': '<?php echo ASSETS_PATH;?>uploadify/docuploadify.php',
                'formData': {PROJECT: '<?php echo SITE_FOLDER;?>', targetFolder: 'images/file/', thumb_width: 200, thumb_height: 200},
                'method': 'post',
                'cancelImg': '<?php echo BASE_URL;?>uploadify/cancel.png',
                'auto': true,
                'multi': false,
                'hideButton': false,
                'buttonText': 'Upload File',
                'width': 125,
                'height': 21,
                'removeCompleted': true,
                'progressData': 'speed',
                'uploadLimit': 100,
                'fileTypeExts': '*.pdf',
                'buttonClass': 'button formButtons',
                /* 'checkExisting' : '/uploadify/check-exists.php',*/
                'onUploadSuccess': function (file, data, response) {
                    var filename = data;
                    $.post('<?php echo BASE_URL;?>apanel/file/uploaded_file.php', {imagefile: filename}, function (msg) {
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