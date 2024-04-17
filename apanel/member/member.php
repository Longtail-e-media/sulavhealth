<link href="<?php echo ASSETS_PATH; ?>uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
<?php
$moduleTablename = "tbl_member"; // Database table name
$moduleId = 33;                // module id >>>>> tbl_modules
$moduleFoldername = "";        // Image folder name

if (isset($_GET['page']) && $_GET['page'] == "member" && isset($_GET['mode']) && $_GET['mode'] == "list"):
    clearImages($moduleTablename, "member");
    clearImages($moduleTablename, "member/thumbnails");
    ?>

    <h3>List Members</h3>
    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <table cellpadding="0" cellspacing="0" border="0" class="table" id="example">
                <thead>
                <tr>
                    <th class="text-center">S.No.</th>
                    <th>Full Name</th>
                    <th>Questions</th>
                    <th class="text-center">Phone No</th>
                    <th class="text-center">Email</th>
                    <th>Approved</th>
                    <th class="text-center"><?php echo $GLOBALS['basic']['action']; ?></th>
                </tr>
                </thead>

                <tbody>
                <?php
                $records = Member::find_by_sql("SELECT * FROM " . $moduleTablename . " ORDER BY sortorder ASC ");

                $idArr = array();
                foreach ($records as $key => $record) {
                    $countPrope = Userquestion::get_total_unanswered_question_per_user($record->id);
                    $idArr[] = array("id" => $record->id, "count" => $countPrope);
                }

                function array_sort_by_column(&$arr, $col, $dir = SORT_DESC)
                {
                    $sort_col = array();
                    foreach ($arr as $key => $row) {
                        $sort_col[$key] = $row[$col];
                    }
                    array_multisort($sort_col, $dir, $arr);
                }

                array_sort_by_column($idArr, 'count');

                foreach ($idArr as $key => $val):
                    $record = Member::find_by_id($val['id']); ?>
                    <tr id="<?php echo $record->id; ?>">
                        <td class="text-center"><?php echo $key + 1; ?></td>
                        <td><?php echo $record->name; ?></td>
                        <td class="text-center">
                            <a class="primary-bg medium btn loadingbar-demo" title="" onClick="viewQuestionsList(<?php echo $record->id; ?>);"
                               href="javascript:void(0);">
                                <span class="button-content">
                                    <span class="badge bg-orange radius-all-4 mrg5R" title="" data-original-title="Badge with tooltip">
                                        <?php echo $countPrope = Userquestion::get_total_unanswered_question_per_user($record->id); ?>
                                    </span>
                                    <span class="text-transform-upr font-bold font-size-11">
                                        <?php if ($countPrope < 2) {
                                            echo "Question";
                                        } else {
                                            echo "Questions";
                                        } ?>
                                    </span>
                                </span>
                            </a>
                        </td>
                        <td><?php echo $record->phone; ?></td>
                        <td><?php echo $record->email ?></td>

                        <td class="text-center">
                            <?php $statusImage = ($record->status == 1) ? "bg-green" : "bg-red";
                            $statusText = ($record->status == 1) ? 'Un-approved' : 'Approved'; ?>
                            <a href="javascript:void(0);" class="btn small <?php echo $statusImage; ?> tooltip-button lstatusToggler"
                               data-placement="top" title="<?php echo $statusText; ?>" status="<?php echo $record->status; ?>"
                               id="futimgHolder_<?php echo $record->id; ?>" moduleId="<?php echo $record->id; ?>">
                                <i class="glyph-icon icon-flag"></i>
                            </a>
                        </td>

                        <td class="text-center">
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
    </div>

<?php elseif (isset($_GET['mode']) && $_GET['mode'] == "addEdit"):
    if (isset($_GET['id']) && !empty($_GET['id'])):
        $memberId = addslashes($_REQUEST['id']);
        $memberInfo = Member::find_by_id($memberId);

        $status = ($memberInfo->status == 1) ? "checked" : " ";
        $unstatus = ($memberInfo->status == 0) ? "checked" : " ";
    endif;
    ?>

    <h3>
        <?php echo (isset($_GET['id'])) ? 'Edit Member' : 'Add Member'; ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);" onClick="viewMemberList();">
    <span class="glyph-icon icon-separator">
    	<i class="glyph-icon icon-arrow-circle-left"></i>
    </span>
            <span class="button-content"> Back </span>
        </a>
    </h3>
    <script language="javascript">
        $(document).ready(function () {
            $('#adminusersetting_frm').passroids({
                main: '#password',
                verify: '#passwordConfirm',
                minimum: 3
            });
        });
    </script>
    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <form action="" class="col-md-12 center-margin" id="member_frm">

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Full Name:
                        </label>
                    </div>
                    <div class="form-input col-md-8">
                        <input placeholder="Full Name" class="col-md-6 validate[required,length[0,255]]" type="text" name="name"
                               id="name" value="<?php echo !empty($memberInfo->name) ? $memberInfo->name : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Email :
                        </label>
                    </div>
                    <div class="form-input col-md-8">
                        <input placeholder="Email" class="col-md-6 validate[required,length[0,50]]" type="text" name="email" id="email"
                               value="<?php echo !empty($memberInfo->email) ? $memberInfo->email : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Phone No. :
                        </label>
                    </div>
                    <div class="form-input col-md-8">
                        <input placeholder="Contact" class="col-md-6 validate[required,length[0,50]]" type="text" name="phone" id="phone"
                               value="<?php echo !empty($memberInfo->phone) ? $memberInfo->phone : ""; ?>">
                    </div>
                </div>


                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Password :
                        </label>
                    </div>
                    <div class="form-input col-md-8">
                        <input placeholder="Password" class="col-md-6 <?php echo !empty($memberInfo) ? '' : 'validate[required,length[0,50]]'; ?>"
                               type="password" name="password" id="password">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Re-password :
                        </label>
                    </div>
                    <div class="form-input col-md-8">
                        <input placeholder="Re-password" class="col-md-6 validate[equals[password]]" type="password" id="passwordConfirm">
                    </div>
                </div>

                <div class="form-row add-image">
                    <div class="form-label col-md-2">
                        <label for="">
                            Image :
                        </label>
                    </div>

                    <?php if (!empty($memberInfo->image)): ?>
                        <div class="col-md-3" id="removeSavedimg1">
                            <div class="infobox info-bg">
                                <div class="button-group" data-toggle="buttons">
                                    <span class="float-left">
                                        <?php
                                        if (file_exists(SITE_ROOT . "images/member/" . $memberInfo->image)):
                                            $filesize = filesize(SITE_ROOT . "images/member/" . $memberInfo->image);
                                            echo 'Size : ' . getFileFormattedSize($filesize);
                                        endif;
                                        ?>
                                    </span>
                                    <a class="btn small float-right" href="javascript:void(0);" onclick="deleteSavedMemberImage(1);">
                                        <i class="glyph-icon icon-trash-o"></i>
                                    </a>
                                </div>
                                <img src="<?php echo IMAGE_PATH . 'member/thumbnails/' . $memberInfo->image; ?>"
                                     style="width:100%"/>
                                <input type="hidden" name="imageArrayname" value="<?php echo $memberInfo->image; ?>" class=""/>
                            </div>
                        </div>
                    <?php endif; ?>

                    <div class="form-input col-md-10 uploader <?php echo !empty($memberInfo->image) ? "hide" : ""; ?>">
                        <input type="file" name="background_upload" id="background_upload" class="transparent no-shadow">
                    </div>
                    <!-- Upload user image preview -->
                    <div id="preview_Image"></div>
                </div>


                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Status (Approval) :
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

                <button btn-action='0' type="submit" name="submit" id="btn-submit" title="Save"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4">
                    <span class="button-content">
                        Save
                    </span>
                </button>
                <button btn-action='1' type="submit" name="submit" id="btn-submit" title="Save"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4">
                    <span class="button-content">
                        Save & More
                    </span>
                </button>
                <button btn-action='2' type="submit" name="submit" id="btn-submit" title="Save"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4">
                    <span class="button-content">
                        Save & quit
                    </span>
                </button>
                <input myaction='0' type="hidden" name="idValue" id="idValue" value="<?php echo !empty($memberInfo->id) ? $memberInfo->id : 0; ?>"/>
            </form>
        </div>
    </div>

    <script type="text/javascript" src="<?php echo ASSETS_PATH; ?>uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript">
        // <![CDATA[
        $(document).ready(function () {
            $('#background_upload').uploadify({
                'swf': '<?php echo ASSETS_PATH;?>uploadify/uploadify.swf',
                'uploader': '<?php echo ASSETS_PATH;?>uploadify/uploadify.php',
                'formData': {
                    PROJECT: '<?php echo SITE_FOLDER;?>',
                    targetFolder: 'images/member/',
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
                    $.post('<?php echo BASE_URL;?>apanel/member/uploaded_image.php', {imagefile: filename}, function (msg) {
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

<?php endif;
include('answer.php');
?>