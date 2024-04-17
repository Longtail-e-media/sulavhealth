<?php
$moduleTablename = "tbl_coupon";    // Database table name

if (isset($_GET['page']) && $_GET['page'] == "coupon" && isset($_GET['mode']) && $_GET['mode'] == "list"):
    ?>
    <h3>
        List Coupons
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);" onClick="addNewCoupon();">
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
                    <!--<th>Title(Greek)</th>-->
                    <th>Code</th>
                    <th class="text-center"><?php echo $GLOBALS['basic']['action']; ?></th>
                </tr>
                </thead>

                <tbody>
                <?php $records = Coupon::find_by_sql("SELECT * FROM " . $moduleTablename . " ORDER BY sortorder DESC ");
                foreach ($records as $key => $record): ?>
                    <tr id="<?php echo $record->id; ?>">
                        <td style="display:none;"><?php echo $key + 1; ?></td>
                        <td><input type="checkbox" class="bulkCheckbox" bulkId="<?php echo $record->id; ?>"/></td>
                        <td>
                            <div class="col-md-7">
                                <a href="javascript:void(0);" onClick="editRecord(<?php echo $record->id; ?>);" class="loadingbar-demo"
                                   title="<?php echo $record->title; ?>"><?php echo $record->title; ?></a>
                            </div>
                        </td>
                        <!--<td><?php echo $record->title_greek; ?></td>-->
                        <td><?php echo $record->code; ?></td>
                        <td class="text-center">
                            <?php
                            $statusImage = ($record->status == 1) ? "bg-green" : "bg-red";
                            $statusText = ($record->status == 1) ? $GLOBALS['basic']['clickUnpub'] : $GLOBALS['basic']['clickPub'];
                            ?>
                            <a href="javascript:void(0);" class="btn small <?php echo $statusImage; ?> tooltip-button statusToggler" data-placement="top"
                               title="<?php echo $statusText; ?>" status="<?php echo $record->status; ?>" id="imgHolder_<?php echo $record->id; ?>"
                               moduleId="<?php echo $record->id; ?>">
                                <i class="glyph-icon icon-flag"></i>
                            </a>
                            <a href="javascript:void(0);" class="loadingbar-demo btn small bg-blue-alt tooltip-button" data-placement="top" title="Edit"
                               onclick="editRecord(<?php echo $record->id; ?>);">
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
            <span class="glyph-icon icon-separator float-right"><i class="glyph-icon icon-cog"></i></span>
            <span class="button-content"> Click </span>
        </a>
    </div>

<?php elseif (isset($_GET['mode']) && $_GET['mode'] == "addEdit"):
    if (isset($_GET['id']) && !empty($_GET['id'])):
        $couponId = addslashes($_REQUEST['id']);
        $couponInfo = Coupon::find_by_id($couponId);

        $status = ($couponInfo->status == 1) ? "checked" : " ";
        $unstatus = ($couponInfo->status == 0) ? "checked" : " ";
    endif;
    ?>
    <h3>
        <?php echo (isset($_GET['id'])) ? 'Edit Coupon' : 'Add Coupon'; ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);" onClick="viewCouponList();">
            <span class="glyph-icon icon-separator"><i class="glyph-icon icon-arrow-circle-left"></i></span>
            <span class="button-content"> Back </span>
        </a>
    </h3>

    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <form action="" class="col-md-12 center-margin" id="coupon_frm">
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Title :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <input placeholder="Title" class="col-md-6 validate[required,length[0,200]]" type="text" name="title" id="title"
                               value="<?php echo !empty($couponInfo->title) ? $couponInfo->title : ""; ?>">
                    </div>
                </div>

                <!--<div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="" class="row">
                            Title (Greek):
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <input placeholder="Title Greek" class="col-md-6" type="text" name="title_greek" id="title_greek"
                               value="<?php echo !empty($couponInfo->title_greek) ? $couponInfo->title_greek : ""; ?>">
                    </div>
                </div>-->

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Code :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <input placeholder="Code" class="col-md-4 validate[required,length[0,200]]" type="text" name="code" id="code"
                               value="<?php echo !empty($couponInfo->code) ? $couponInfo->code : ""; ?>">
                        <a class="btn medium bg-orange mrg5T" title="Read More" id="generateCode" href="javascript:void(0);">
                            <span class="button-content">Generate</span>
                        </a>
                        <span id="error"></span>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Discount :
                        </label>
                    </div>
                    <div class="form-input col-md-6">
                        <input placeholder="Discount" class="col-md-2 validate[required,length[0,200]]" type="text" name="discount" id="discount"
                               value="<?php echo !empty($couponInfo->discount) ? $couponInfo->discount : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Start Date :
                        </label>
                    </div>
                    <div class="form-input col-md-4">
                        <input placeholder="Start Date" class="col-md-6 validate[required] datepicker" type="text" name="start_date" id="start_date"
                               value="<?php echo !empty($couponInfo->start_date) ? $couponInfo->start_date : ""; ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            End Date :
                        </label>
                    </div>
                    <div class="form-input col-md-4">
                        <input placeholder="End Date" class="col-md-6 validate[required] datepicker" type="text" name="end_date" id="end_date"
                               value="<?php echo !empty($couponInfo->end_date) ? $couponInfo->end_date : ""; ?>">
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

                <button btn-action='0' type="submit" name="submit" id="btn-submit" title="Save"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4">
                    <span class="button-content">Save</span>
                </button>
                <button btn-action='1' type="submit" name="submit" id="btn-submit" title="Save"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4">
                    <span class="button-content">Save & More</span>
                </button>
                <button btn-action='2' type="submit" name="submit" id="btn-submit" title="Save"
                        class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4">
                    <span class="button-content">Save & quit</span>
                </button>
                <input myaction='0' type="hidden" name="idValue" id="idValue" value="<?php echo !empty($couponInfo->id) ? $couponInfo->id : 0; ?>"/>
            </form>
        </div>
    </div>
<?php endif; ?>