<?php
$moduleTablename = "tbl_sites"; // Database table name

if (isset($_GET['page']) && $_GET['page'] == "site" && isset($_GET['mode']) && $_GET['mode'] == "list"):
    $parentId = (isset($_REQUEST['id']) and !empty($_REQUEST['id'])) ? addslashes($_REQUEST['id']) : 0;
    ?>
    <h3>
        List Sites
        <?php if (!empty($_REQUEST['id'])) { ?>
            <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
               onClick="viewSitesList();">
                <span class="glyph-icon icon-separator"><i class="glyph-icon icon-arrow-circle-left"></i></span>
                <span class="button-content"> Back </span>
            </a>
        <?php } ?>
        <?php if ($parentId != 0) { ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="addNewSite();">
            <span class="glyph-icon icon-separator"><i class="glyph-icon icon-plus-square"></i></span>
            <span class="button-content"> Add New </span>
        </a>
        <?php } ?>
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
                <?php $records = Site::find_all_byparnt($parentId);
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
                                <?php $countChild = Site::getTotalChild($record->id);
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
                            <?php if ($parentId != 0) { ?>
                            <a href="javascript:void(0);" class="btn small bg-red tooltip-button" data-placement="top"
                               title="Remove" onclick="recordDelete(<?php echo $record->id; ?>);">
                                <i class="glyph-icon icon-remove"></i>
                            </a>
                            <?php } ?>
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
                <?php if ($parentId != 0) { ?>
                <option value="delete"><?php echo $GLOBALS['basic']['delete']; ?></option>
                <?php } ?>
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
        $siteId     = addslashes($_REQUEST['id']);
        $siteInfo   = Site::find_by_id($siteId);
        $status     = ($siteInfo->status == 1) ? "checked" : " ";
        $unstatus   = ($siteInfo->status == 0) ? "checked" : " ";
        // $homepage = ($siteInfo->homepage == 1) ? "checked" : " ";
        // $nothomepage = ($siteInfo->homepage == 0) ? "checked" : " ";
    endif;
    ?>
    <h3>
        <?php echo (isset($_GET['id'])) ? 'Edit Site' : 'Add Site'; ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="viewSitesList();">
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
                        <?php $Parentview = !empty($siteInfo->parentId) ? $siteInfo->parentId : 0;
                        echo Site::get_parentList_bylevel(1, $Parentview); ?>
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
                               value="<?php echo !empty($siteInfo->title) ? $siteInfo->title : ""; ?>">
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
                               value="<?php echo !empty($siteInfo->delivery_charge) ? $siteInfo->delivery_charge : ""; ?>">
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
                               value="<?php echo !empty($siteInfo->latitude) ? $siteInfo->latitude : ""; ?>">
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
                               value="<?php echo !empty($siteInfo->longitude) ? $siteInfo->longitude : ""; ?>">
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
                <input myaction='0' type="hidden" name="idValue" id="idValue" value="<?php echo !empty($siteInfo->id) ? $siteInfo->id : 0; ?>"/>
            </form>
        </div>
    </div>

<?php endif; ?>