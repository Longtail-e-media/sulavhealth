<?php
$moduleTablename = "tbl_user_questions"; // Database table name

if (isset($_GET['page']) && $_GET['page'] == "member" && isset($_GET['mode']) && $_GET['mode'] == "questionslist"):
    $id = intval(addslashes($_GET['id']));
    ?>
    <h3>
        Questions from ["<?php echo Member::field_by_id($id, 'name'); ?>"]
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);" onClick="viewMemberList();">
            <span class="glyph-icon icon-separator">
              <i class="glyph-icon icon-arrow-circle-left"></i>
            </span>
            <span class="button-content"> Back </span>
        </a>
    </h3>
    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <table cellpadding="0" cellspacing="0" border="0" class="table" id="subexample">
                <thead>
                <tr>
                    <th>S N</th>
                    <th>Question</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $records = Userquestion::find_by_sql("SELECT * FROM " . $moduleTablename . " WHERE user_id=" . $id . " ORDER BY sortorder DESC ");
                foreach ($records as $key => $record): ?>
                    <tr id="<?php echo $record->id; ?>">
                        <td class="text-center"><?php echo $key + 1; ?></td>
                        <td>
                            <div class="col-md-9">
                                <?php if (strlen($record->question) > 100) {
                                    echo substr($record->question, '0', '100') . '...';
                                } else {
                                    echo $record->question;
                                } ?>
                            </div>
                        </td>
                        <td class="text-center">
                            <?php
                            $ans = Useranswer::find_by_user_question_id($record->user_id, $record->id);
                            $status = (!empty($ans)) ? 'Answered' : 'Unanswered';
                            echo $status;
                            ?>
                        </td>
                        <td class="text-center">
                            <a href="javascript:void(0);" class="loadingbar-demo btn small bg-blue-alt tooltip-button" data-placement="top"
                               title="Answer" onclick="giveAnswer(<?php echo $record->id; ?>);">
                                <i class="glyph-icon icon-edit"></i>
                            </a>
                            <input name="sortId" type="hidden" value="<?php echo $record->id; ?>">
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

<?php elseif (isset($_GET['mode']) && $_GET['mode'] == "questionsedit"):
    if (isset($_GET['id']) && !empty($_GET['id'])):
        $questionId = addslashes($_REQUEST['id']);
        $questionInfo = Userquestion::find_by_id($questionId);
        $answerInfo = Useranswer::find_by_user_question_id($questionInfo->user_id, $questionId);
    endif;
    ?>
    <h3>
        <?php echo (!empty($answerInfo->id)) ? 'Edit Answer' : 'Add Answer'; ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="viewQuestionsList(<?= $questionInfo->user_id ?>);">
            <span class="glyph-icon icon-separator">
                <i class="glyph-icon icon-arrow-circle-left"></i>
            </span>
            <span class="button-content"> Back </span>
        </a>
    </h3>
    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <form action="" class="col-md-12 center-margin" id="answer_frm">

                <input type="hidden" name="q_id" value="<?= $questionId ?>">
                <input type="hidden" name="user_id" value="<?= $questionInfo->user_id ?>">
                <input type="hidden" name="admin_id" value="<?= $session->get('u_id') ?>">

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Question:
                        </label>
                    </div>
                    <div class="form-input col-md-8">
                        <p class=""><?php echo !empty($questionInfo->question) ? $questionInfo->question : ""; ?></p>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-12">
                        <label for="answer">
                            Answer :
                        </label>
                        <textarea name="answer" id="answer"
                                  class="large-textarea validate[required]"><?php echo !empty($answerInfo->answer) ? $answerInfo->answer : ""; ?></textarea>
                        <a class="btn medium bg-orange mrg5T hide" title="Read More" id="readMore"
                           href="javascript:void(0);">
                            <span class="button-content">Read More</span>
                        </a>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="file_id">
                            Files :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <select name="file_id[]" id="file_id" style="min-height:100px;" class="" multiple>
                            <?php
                            $fileList = File::find_all_asc();
                            $saveReca = unserialize($answerInfo->file_id);
                            if ($saveReca == NULL) {
                                foreach ($fileList as $file) { ?>
                                    <option value="<?php echo $file->id; ?>"><?php echo $file->title; ?></option>
                                <?php } ?>
                                <?php
                            } else {
                                foreach ($fileList as $file) {
                                    $selected = '';
                                    foreach ($saveReca as $saved) {
                                        if ($saved == $file->id) {
                                            $selected = ' selected ';
                                        }
                                    }
                                    ?>
                                    <option value="<?php echo $file->id; ?>" <?php echo $selected ?>><?php echo $file->title; ?></option>
                                <?php } ?>
                                <?php
                            } ?>
                        </select>
                        <label>
                            <small>Press Ctrl+Click to Select Multiple</small>
                        </label>
                    </div>
                </div>

                <button btn-action='0' type="submit" name="submit" id="btn-submit" title="Send"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4">
                    <span class="button-content">Send</span>
                </button>

                <input myaction='0' type="hidden" name="idValue" id="idValue" value="<?php echo !empty($answerInfo->id) ? $answerInfo->id : 0; ?>"/>
            </form>
        </div>
    </div>
    <script>
        var base_url = "<?php echo ASSETS_PATH; ?>";
        var editor_arr = ["answer"];
        create_editor(base_url, editor_arr);
    </script>
<?php
endif;
?>
