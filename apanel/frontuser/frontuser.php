<?php
$moduleTablename = "tbl_users";     // Database table name

if (isset($_GET['page']) && $_GET['page'] == "frontuser" && isset($_GET['mode']) && $_GET['mode'] == "list"):
    ?>
    <h3>
        List Front Users
        <a class="loadingbar-demo btn medium bg-blue-alt float-right hide" href="javascript:void(0);"
           onClick="AddNewUsers();">
            <span class="glyph-icon icon-separator"><i class="glyph-icon icon-plus-square"></i></span>
            <span class="button-content"> Add User </span>
        </a>
    </h3>
    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <table cellpadding="0" cellspacing="0" border="0" class="table" id="example">
                <thead>
                <tr>
                    <th class="text-center">S.No.</th>
                    <th>Full Name</th>
                    <th class="text-center">Email</th>
                    <th class="text-center"><?php echo $GLOBALS['basic']['action']; ?></th>
                </tr>
                </thead>

                <tbody>
                <?php $records = User::find_by_sql("SELECT * FROM " . $moduleTablename . " WHERE group_id=2 ORDER BY sortorder ASC ");
                foreach ($records as $record): ?>
                    <tr id="<?php echo $record->id; ?>">
                        <td class="text-center"><?php echo $record->sortorder; ?></td>
                        <td>
                            <div class="col-md-7">
                                <a href="javascript:void(0);" onClick="editRecord(<?php echo $record->id; ?>);"
                                   class="loadingbar-demo"
                                   title="<?php echo $record->first_name . ' ' . $record->middle_name . ' ' . $record->last_name; ?>"><?php echo $record->first_name . ' ' . $record->middle_name . ' ' . $record->last_name; ?></a>
                            </div>
                        </td>
                        <td><?php echo !empty($record->email) ? $record->email : ''; ?></td>
                        <td class="text-center">
                            <?php
                            $statusImage = ($record->status == 1) ? "bg-green" : "bg-red";
                            $statusText = ($record->status == 1) ? $GLOBALS['basic']['clickUnpub'] : $GLOBALS['basic']['clickPub'];
                            ?>
                            <?php if ($record->group_id != 1): ?>
                                <a href="javascript:void(0);"
                                   class="btn small <?php echo $statusImage; ?> tooltip-button statusTogglr lstatusToggler"
                                   data-placement="top" title="<?php echo $statusText; ?>"
                                   status="<?php echo $record->status; ?>" id="imgHolder_<?php echo $record->id; ?>"
                                   moduleId="<?php echo $record->id; ?>">
                                    <i class="glyph-icon icon-flag"></i>
                                </a>
                            <?php endif; ?>
                            <a href="javascript:void(0);" class="loadingbar-demo btn small bg-green tooltip-button"
                               data-placement="top" title="View Details"
                               onclick="detail(<?php echo $record->id; ?>);">
                                <i class="glyph-icon icon-eye"></i>
                            </a>
                            <!--<a href="javascript:void(0);" class="loadingbar-demo btn small bg-blue-alt tooltip-button"
                               data-placement="top" title="Edit" onclick="editRecord(<?php echo $record->id; ?>);">
                                <i class="glyph-icon icon-edit"></i>
                            </a>-->
                            <?php if ($record->group_id != 1): ?>
                                <a href="javascript:void(0);" class="btn small bg-red tooltip-button"
                                   data-placement="top" title="Remove"
                                   onclick="recordDelete(<?php echo $record->id; ?>);">
                                    <i class="glyph-icon icon-remove"></i>
                                </a>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

<?php elseif (isset($_GET['mode']) && $_GET['mode'] == "addEdit"):
    if (isset($_GET['id']) && !empty($_GET['id'])):
        $userId = addslashes($_REQUEST['id']);
        $usersInfo = User::find_by_id($userId);
        $published = ($usersInfo->status == 1) ? "checked" : "";
        $unpublished = ($usersInfo->status == 0) ? "checked" : "";
    endif;
    ?>
    <h3>
        <?php echo (isset($_GET['id'])) ? 'Edit User' : 'Add User'; ?>
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="viewuserslist();">
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
                minimum: 6
            });
        });
    </script>
    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">
            <form action="" class="col-md-10 center-margin" id="adminusersetting_frm">
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Group Type :
                        </label>
                    </div>
                    <div class="form-input col-md-4" style="padding:0px !important;">
                        <select data-placeholder="Choose Field Type"
                                class="chosen-select validate[required,length[0,500]]" id="field_type"
                                name="field_type">
                            <option value="">Choose</option>
                            <?php $GroupTypeRec = Usergrouptype::find_all();
                            if ($GroupTypeRec): foreach ($GroupTypeRec as $GroupTypeRow):
                                $sel = (!empty($usersInfo->group_id) && $usersInfo->group_id == $GroupTypeRow->id) ? 'selected' : '';
                                ?>
                                <option value="<?php echo $GroupTypeRow->id; ?>" <?php echo $sel; ?>><?php echo $GroupTypeRow->group_name; ?></option>
                            <?php endforeach; endif; ?>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            First Name :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="First Name" class="col-md-4 validate[required,length[0,50]]" type="text"
                               name="first_name" id="first_name"
                               value="<?php echo !empty($usersInfo->first_name) ? $usersInfo->first_name : ""; ?>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Middle Name :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Middle Name" class="col-md-4 validate[length[0,50]]" type="text"
                               name="middle_name" id="middle_name"
                               value="<?php echo !empty($usersInfo->middle_name) ? $usersInfo->middle_name : ""; ?>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Last Name :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Last Name" class="col-md-4 validate[length[0,50]]" type="text"
                               name="last_name" id="last_name"
                               value="<?php echo !empty($usersInfo->last_name) ? $usersInfo->last_name : ""; ?>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Username :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Username"
                               class="col-md-4 validate[required,maxSize[10],custom[onlyLetterNumber]]" type="text"
                               name="username" id="username"
                               value="<?php echo !empty($usersInfo->username) ? $usersInfo->username : ""; ?>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Password :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Password"
                               class="col-md-4 <?php echo !empty($usersInfo) ? '' : 'validate[required,length[0,50]]'; ?>"
                               type="password" name="password" id="password">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Re-password :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Re-password" class="col-md-4 validate[equals[password]]" type="password"
                               id="passwordConfirm">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-label col-md-2">
                        <label for="">
                            Email :
                        </label>
                    </div>
                    <div class="form-input col-md-20">
                        <input placeholder="Email Address" class="col-md-4 validate[required,custom[email]]" type="text"
                               id="email" name="email"
                               value="<?php echo !empty($usersInfo->email) ? $usersInfo->email : ""; ?>">
                    </div>
                </div>

                <?php if (isset($_GET['id']) and $usersInfo->group_id != '2') { ?>
                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                CC Email :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="CC Email Address" class="col-md-4" type="text" id="optional_email"
                                   name="optional_email"
                                   value="<?php echo !empty($usersInfo->optional_email) ? $usersInfo->optional_email : ""; ?>">
                            <br/>
                            <small>if more than one email address. e.g. email1@email.com;email2@email.com</small>
                        </div>
                    </div>
                <?php } ?>

                <?php if (isset($_GET['id']) and $usersInfo->group_id == '2') { ?>
                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                Address :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="Address" class="col-md-4" type="text" id="facebook_uid"
                                   name="facebook_uid"
                                   value="<?php echo !empty($usersInfo->facebook_uid) ? $usersInfo->facebook_uid : ""; ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                Phone Number :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="Phone Number" class="col-md-4" type="text" id="contact"
                                   name="contact"
                                   value="<?php echo !empty($usersInfo->contact) ? $usersInfo->contact : ""; ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                Gender :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <select data-placeholder="Choose Field Type"
                                    class="chosen-selec validate[required,length[0,500]] col-md-4" id="gender"
                                    name="gender">
                                <option value="">Choose</option>
                                <option value="0" <?php echo (!empty($usersInfo->gender) && $usersInfo->gender == 0) ? 'selected' : ''; ?> >
                                    Male
                                </option>
                                <option value="1" <?php echo (!empty($usersInfo->gender) && $usersInfo->gender == 1) ? 'selected' : ''; ?> >
                                    Female
                                </option>
                                <option value="2" <?php echo (!empty($usersInfo->gender) && $usersInfo->gender == 2) ? 'selected' : ''; ?> >
                                    Other
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                DOB :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="DOB" class="col-md-4" type="text" id="dob"
                                   name="dob"
                                   value="<?php echo !empty($usersInfo->dob) ? $usersInfo->dob : ""; ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                Marital Status :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <select data-placeholder="Choose Field Type"
                                    class="chosen-selec validate[required,length[0,500]] col-md-4" id="marital_status"
                                    name="marital_status">
                                <option value="">Choose</option>
                                <option value="0" <?php echo (!empty($usersInfo->marital_status) && $usersInfo->marital_status == 0) ? 'selected' : ''; ?> >
                                    Single
                                </option>
                                <option value="1" <?php echo (!empty($usersInfo->marital_status) && $usersInfo->marital_status == 1) ? 'selected' : ''; ?> >
                                    Married
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                Weight :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="Weight" class="col-md-4" type="text" id="weight"
                                   name="weight"
                                   value="<?php echo !empty($usersInfo->weight) ? $usersInfo->weight : ""; ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                Height :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="Height" class="col-md-4" type="text" id="height"
                                   name="height"
                                   value="<?php echo !empty($usersInfo->height) ? $usersInfo->height : ""; ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                District :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="District" class="col-md-4" type="text" id="district"
                                   name="district"
                                   value="<?php echo !empty($usersInfo->district) ? $usersInfo->district : ""; ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                City :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="City" class="col-md-4" type="text" id="city"
                                   name="city"
                                   value="<?php echo !empty($usersInfo->city) ? $usersInfo->city : ""; ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                Postal Code :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="Postal Code" class="col-md-4" type="text" id="postal"
                                   name="postal"
                                   value="<?php echo !empty($usersInfo->postal) ? $usersInfo->postal : ""; ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                Blood Group :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="Blood Group" class="col-md-4" type="text" id="blood_group"
                                   name="blood_group"
                                   value="<?php echo !empty($usersInfo->blood_group) ? $usersInfo->blood_group : ""; ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-label col-md-2">
                            <label for="">
                                Google Maps Link :
                            </label>
                        </div>
                        <div class="form-input col-md-20">
                            <input placeholder="Google Maps Link" class="col-md-4" type="text" id="Google_maps"
                                   name="Google_maps"
                                   value="<?php echo !empty($usersInfo->Google_maps) ? $usersInfo->Google_maps : ""; ?>">
                        </div>
                    </div>
                <?php } ?>


                <div class="form-row">
                    <div class="form-label col-md-2"></div>
                    <div class="form-checkbox-radio col-md-9">
                        <input type="radio" class="custom-radio" name="status" id="check1"
                               value="1" <?php echo !empty($published) ? $published : "checked"; ?>>
                        <label for="">Published</label>
                        <input type="radio" class="custom-radio" name="status" id="check0"
                               value="0" <?php echo !empty($unpublished) ? $unpublished : ""; ?>>
                        <label for="">Un-published</label>
                    </div>
                </div>
                <div class="form-label col-md-2"></div>
                <button type="submit" name="submit"
                        class="btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4"
                        id="btn-submit" title="Save">
                <span class="button-content">
                    Save
                </span>
                </button>
                <input type="hidden" name="idValue" id="idValue" value="<?php echo !empty($userId) ? $userId : 0; ?>"/>
            </form>
        </div>
    </div>

<?php elseif (isset($_GET['mode']) && $_GET['mode'] == "detail"):
    $genderArr = ['0' => 'Male', '1' => 'Female', '2' => 'Other'];
    $maritalArr = ['0' => 'Single', '1' => 'Married'];
    if (isset($_GET['id']) && !empty($_GET['id'])):
        $userId = addslashes($_REQUEST['id']);
        $usersInfo = User::find_by_id($userId);

    endif; ?>
    <h3>
        Details of [<?= $usersInfo->first_name ?> <?= $usersInfo->last_name ?>]
        <a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);"
           onClick="viewuserslist();">
            <span class="glyph-icon icon-separator"><i class="glyph-icon icon-arrow-circle-left"></i></span>
            <span class="button-content"> Back </span>
        </a>
    </h3>
    <div class="my-msg"></div>
    <div class="example-box">
        <div class="example-code">

            <div class="col-sm-12 hide"><h3>Personal Information</h3></div>

            <div class="col-sm-4">
                <ul>
                    <li><strong>Full Name : </strong><?php echo $usersInfo->first_name . ' ' . $usersInfo->last_name; ?></li>
                    <li><strong>Phone Number : </strong><?php echo $usersInfo->contact; ?></li>
                    <li><strong>Marital Status : </strong><?php echo $maritalArr[$usersInfo->marital_status]; ?></li>
                    <li><strong>District : </strong><?php echo $usersInfo->district; ?></li>
                    <li><strong>Blood Group : </strong><?php echo $usersInfo->blood_group; ?></li>
                    <li><strong>Shipping Location (Home) : </strong>
                        <?php if (!empty($usersInfo->shipping_location_home)) {
                            $locationRec = locationn::find_by_id($usersInfo->shipping_location_home);
                            echo $locationRec->title;
                        } ?>
                    </li>
                    <li><strong>Shipping District (Office) : </strong>
                        <?php if (!empty($usersInfo->shipping_district_office)) {
                            $locationRec = locationn::find_by_id($usersInfo->shipping_district_office);
                            echo $locationRec->title;
                        } ?>
                    </li>
                    <li><strong>Google Maps Link : </strong><?php echo $usersInfo->Google_maps; ?></li>
                </ul>
            </div>

            <div class="col-sm-4">
                <ul>
                    <li><strong>Email Address : </strong><?php echo $usersInfo->email; ?></li>
                    <li><strong>Gender : </strong><?php echo $genderArr[$usersInfo->gender]; ?></li>
                    <li><strong>Weight : </strong><?php echo $usersInfo->weight; ?></li>
                    <li><strong>City : </strong><?php echo $usersInfo->city; ?></li>
                    <li><strong>Diseases : </strong><?php echo $usersInfo->diseases; ?></li>
                    <li><strong>Shipping District (Home) : </strong>
                        <?php if (!empty($usersInfo->shipping_district_home)) {
                            $locationRec = locationn::find_by_id($usersInfo->shipping_district_home);
                            echo $locationRec->title;
                        } ?>
                    </li>
                </ul>
            </div>

            <div class="col-sm-4">
                <ul>
                    <li><strong>Address : </strong><?php echo $usersInfo->facebook_uid; ?></li>
                    <li><strong>Date of Birth : </strong><?php echo $usersInfo->dob; ?></li>
                    <li><strong>Height : </strong><?php echo $usersInfo->height; ?></li>
                    <li><strong>Postal Code : </strong><?php echo $usersInfo->postal; ?></li>
                    <li><strong>Medicines : </strong><?php echo $usersInfo->medicines; ?></li>
                    <li><strong>Shipping Location (Office) : </strong>
                        <?php if (!empty($usersInfo->shipping_location_office)) {
                            $locationRec = locationn::find_by_id($usersInfo->shipping_location_office);
                            echo $locationRec->title;
                        } ?>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>

        </div>
    </div>
<?php endif; ?>
