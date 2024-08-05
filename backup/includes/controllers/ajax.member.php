<?php
// Load the header files first
header("Expires: 0");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("cache-control: no-store, no-cache, must-revalidate");
header("Pragma: no-cache");

// Load necessary files then...
require_once('../initialize.php');

$usermail = User::field_by_id('1', 'email');
$sitename = Config::getField('sitename',true);
$bccmail = User::field_by_id('1','optional_email');

$action = $_REQUEST['action'];
switch ($action) {
    case "registerNewUser":
        $record = new Member();

        $record->name       = $_REQUEST['name'];
        $record->email      = $_REQUEST['email'];
        $record->phone      = $_REQUEST['phone'];
        $record->password   = md5($_REQUEST['password']);
        $record->accesskey  = @randomKeys(25);
        $record->status     = 0;
        $record->sortorder  = Member::find_maximum();

        $checkDupliEmail    = Member::checkDupliEmail($record->email);
        if ($checkDupliEmail):
            echo json_encode(array("action" => "warning", "message" => "This email already exists."));
            exit;
        endif;

        $db->begin();
        if ($record->save()): $db->commit();
            echo json_encode(array('action' => 'success', 'message' => 'Your registration is successful, please wait for approval from QSDC!'));
            log_action("Member [" . $record->name . "] login Created " . $GLOBALS['basic']['addedSuccess'], 1, 3);
        else:
            echo json_encode(array('action' => 'unsuccess', 'message' => 'Internal error.'));
        endif;
    break;

    case "updateProfileUser":
        $record             = Member::find_by_id($_REQUEST['idValue']);
        $record->name       = $_REQUEST['name'];
        $record->email      = $_REQUEST['email'];
        $record->phone      = $_REQUEST['phone'];
        $record->password   = (!empty($_REQUEST['password'])) ? md5($_REQUEST['password']) : $record->password;
        $record->image      = (!empty($_REQUEST['imageArrayname'])) ? $_REQUEST['imageArrayname'] : '';
        $record->accesskey  = @randomKeys(25);

//        if ($record->email != $_REQUEST['email']) {
            $checkDupliUname = Member::checkDupliEmail($_REQUEST['email']);
            if ($checkDupliUname):
                echo json_encode(array("action" => "warning", "message" => "Email Already Exists."));
                exit;
            endif;
//        }

        $record->status = 1;

        $db->begin();
        if ($record->save()): $db->commit();
            $message = sprintf($GLOBALS['basic']['changesSaved_'], "Member '" . $record->name . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action("Member [" . $record->name . "] Edit Successfully", 1, 4);
        else: $db->rollback();
            echo json_encode(array("action" => "notice", "message" => $GLOBALS['basic']['noChanges']));
        endif;
    break;

    case "edit":
        $record             = Member::find_by_id($_REQUEST['idValue']);
        $record->name       = $_REQUEST['name'];
        $record->email      = $_REQUEST['email'];
        $record->phone      = $_REQUEST['phone'];
        $record->password   = (!empty($_REQUEST['password'])) ? md5($_REQUEST['password']) : $record->password;
        $record->image      = (!empty($_REQUEST['imageArrayname'])) ? $_REQUEST['imageArrayname'] : '';
        $record->accesskey  = @randomKeys(25);

        if ($record->email != $_REQUEST['email']) {
            $checkDupliUname = Member::checkDupliEmail($_REQUEST['email']);
            if ($checkDupliUname):
                echo json_encode(array("action" => "warning", "message" => "Email Already Exists."));
                exit;
            endif;
        }

        $record->status = $_REQUEST['status'];

        $db->begin();
        if ($record->save()): $db->commit();
            $message = sprintf($GLOBALS['basic']['changesSaved_'], "Member '" . $record->name . "'");
            echo json_encode(array("action" => "success", "message" => $message));
            log_action("Member [" . $record->name . "] Edit Successfully", 1, 4);
        else: $db->rollback();
            echo json_encode(array("action" => "notice", "message" => $GLOBALS['basic']['noChanges']));
        endif;
    break;

    case "toggleApproved":
        $id = $_REQUEST['id'];
        $record = Member::find_by_id($id);

        if ($record->status != '1') {
            $record->status = ($record->status == 1) ? 0 : 1;

            /*
            * Main mail info
            */
            $fullname = $record->name;

            $body = '
                <table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
		  			<tr><td><p>Dear ' . $fullname . ',</p></td></tr>
			  		<tr>
					    <td>    
                            <p>
                                <span style="color:#0065B3; font-size:14px; font-weight:bold">Your Account has been approved by ' . $sitename . '</span>
                                <br />The details provided are :
                            </p>
                            <p><strong>Username</strong> : ' . $record->name . '<br />				
                            <strong>E-mail Address</strong>: ' . $record->email . '<br />
                            <strong>Phone Number</strong>: ' . $record->phone . '<br />
                            <strong>Link</strong>: ' . BASE_URL . 'user/login</p>
				 		</td>
			  		</tr>
			  		<tr>
						<td><p>&nbsp;</p><p>Thank you,<br />' . $sitename . '</p></td>
			  		</tr>
				</table>
            ';

            $mail = new PHPMailer(); // defaults to using php "mail()"
            $mail->SetFrom($usermail, $sitename);
            $mail->AddReplyTo($usermail, $sitename);
            $mail->AddAddress($record->email, $fullname);
            $mail->Subject = "Account Approved From " . $sitename;
            $mail->MsgHTML($body);

            if (!$mail->Send()) {
                $message = "Sorry! Could not send your request.";
                echo json_encode(array("action" => "error", "message" => $message));
            } else {
                $db->begin();
                $record->save();
                $db->commit();
                $message = "Member " . $fullname . " has been approved and sent approve mail.";
                echo json_encode(array("action" => "success", "message" => $message));
            }
        } else {
            $record->status = ($record->status == 1) ? 0 : 1;

            /*
            * Main mail info
            */
            $fullname = $record->name;

            $body = '
                <table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
		  			<tr><td><p>Dear ' . $fullname . ',</p></td></tr>
			  		<tr>
					    <td>    
                            <p>
                                <span style="color:#0065B3; font-size:14px; font-weight:bold">Your Account has been deactivated by ' . $sitename . '</span>
                                <br />The login details provided are :
                            </p>
                            <p><strong>Username</strong> : ' . $record->name . '<br />				
                            <strong>E-mail Address</strong>: ' . $record->email . '<br />
                            <strong>Phone Number</strong>: ' . $record->phone . '<br /><br />
                            Please contact admin for further assistance.
				 		</td>
			  		</tr>
			  		<tr>
						<td><p>&nbsp;</p><p>Thank you,<br />' . $sitename . '</p></td>
			  		</tr>
				</table>
            ';

            $mail = new PHPMailer(); // defaults to using php "mail()"
            $mail->SetFrom($usermail, $sitename);
            $mail->AddReplyTo($usermail, $sitename);
            $mail->AddAddress($record->email, $fullname);
            $mail->Subject = "Account Deactivated From " . $sitename;
            $mail->MsgHTML($body);

            if (!$mail->Send()) {
                $message = "Sorry! Could not send your request.";
                echo json_encode(array("action" => "error", "message" => $message));
            } else {
                $db->begin();
                $record->save();
                $db->commit();
                $message = "Member " . $fullname . " has been decativated and sent mail.";
                echo json_encode(array("action" => "success", "message" => $message));
            }
        }

        break;

    case "delete":
        $id         = addslashes($_REQUEST['id']);
        $record     = Member::find_by_id($id);
        $db->query("DELETE FROM tbl_member WHERE id='{$id}'");

        reOrder("tbl_member", "sortorder");

        $fullname = $record->name;
        $message = sprintf($GLOBALS['basic']['deletedSuccess'], "Member '" . $fullname . "'");
        echo json_encode(array("action" => "success", "message" => $message));
        log_action("Member  [" . $fullname . "]" . $GLOBALS['basic']['deletedSuccess'], 1, 6);
    break;

    // front user login
    case "frontlogin":
        $useraccess = addslashes($_REQUEST['email']);
        $paccess    = addslashes($_REQUEST['password']);

        $sql = 'SELECT * FROM tbl_member WHERE email="' . $useraccess . '"';
        $sql .= ' AND password="' . md5($paccess) . '" LIMIT 1 ';
        $count = $db->num_rows($db->query($sql));

        if ($count > 0) {
            $sqlid = $db->fetch_object($db->query($sql));
            $userid = $sqlid->id;
            $uprec = Member::find_by_email($useraccess);

            if ($uprec->status == 0) {
                $message = "Your account has not been approved by QSDC!";
                echo json_encode(array("action" => "error", "message" => $message));
            } else {
                $session->set('email_logged', $useraccess);
                $session->set('user_id', $userid);
                $remember = isset($_REQUEST['remember']) ? 1 : 0;

                if (!empty($remember)) {
                    setcookie("remem_email", $useraccess, time() + (60 * 60), "/", NULL);
                    setcookie("remem_pass", $paccess, time() + (60 * 60), "/", NULL);
                } else {
                    setcookie("remem_email", '', time() - (60 * 60), "/", NULL);
                    setcookie("remem_pass", '', time() - (60 * 60), "/", NULL);
                }
                $message = "Welcome " . $uprec->name . "! You will be redirected to Dashboard shortly!";
                echo json_encode(array("action" => "success", "message" => $message));
            }
        } else {
            $message = "Email or Password doesn't match !";
            echo json_encode(array("action" => "error", "message" => $message));
        }
    break;

    case "forgetuser_password":
        $emailAddress = addslashes($_REQUEST['email']);
        $mailcheck  = Member::get_validMember_mail($emailAddress);

        if ($mailcheck):
            $accessToken = @randomKeys(10);

            $row = Member::find_by_mail($emailAddress);

            $forgetRec = Member::find_by_id($row->id);

            $forgetRec->access_code = $accessToken;

            /* Mail Format */
            $siteName = Config::getField('sitename', true);
            $AdminEmail = User::get_UseremailAddress_byId(1);
            $UserName = Member::get_user_shotInfo_byId($row->id);
            $fullName = $UserName->name;

            $msgbody = '<div>
                <h3>Reset password on ' . $siteName . '</h3>                
                <div><font face="Trebuchet MS">Dear ' . $fullName . ' !</font> <br /><br><br>
                Please <a href="' . BASE_URL . 'user/reset-password/' . $accessToken . '">click here to reset your password.</a> <br><br>
                If you didn\'t request your password then delete this email.  <br>
                <br><br>
                <p>Thanks,
                <br> Webmaster<br>
                ' . $siteName . '
                </p>
                </div>
                </div>';

            $mail = new PHPMailer();

            $mail->SetFrom($AdminEmail, $siteName, 0);
            $mail->AddReplyTo($forgetRec->email, $fullName);
            $mail->AddAddress($forgetRec->email, $fullName);
            $mail->Subject = "Forgot password on " . $siteName;
            $mail->MsgHTML($msgbody);

            if (!$mail->Send()):
                echo json_encode(array('action' => 'unsuccess', 'message' => 'Not valid User email address'));
            else:
                $forgetRec->save();
                echo json_encode(array('action' => 'success', 'message' => 'Please check your mail for reset password'));
            endif;
        else:
            echo json_encode(array('action' => 'unsuccess', 'message' => 'Not valid User email address'));
        endif;
        break;

    case "changeuser_password":
        $id                     = addslashes($_SESSION['user_id']);
        $record                 = Member::find_by_id($id);
        $record->password       = md5($_REQUEST['password']);
        $record->access_code    = @randomKeys(10);
        if ($record->save()):
            echo json_encode(array('action' => 'success', 'message' => 'Password has been changed, please login!'));
        else:
            echo json_encode(array('action' => 'unsuccess', 'message' => 'Internal error.'));
        endif;
    break;

    case "resetuser_password":
        $id                 = addslashes($_REQUEST['id']);
        $record             = Member::find_by_id($id);
        $record->password   = md5($_REQUEST['password']);
        $record->access_code = @randomKeys(10);
        if ($record->save()):
            echo json_encode(array('action' => 'success', 'message' => 'Password has been changed, please login!'));
        else:
            echo json_encode(array('action' => 'unsuccess', 'message' => 'Internal error.'));
        endif;
    break;

    // Answer
    case "addAnswer":
        $record             = new Useranswer();

        $record->q_id       = $_REQUEST['q_id'];
        $record->user_id    = $_REQUEST['user_id'];
        $record->admin_id   = $_REQUEST['admin_id'];
        $record->answer     = !empty($_REQUEST['answer']) ? $_REQUEST['answer'] : '';
        $record->file_id    = (!empty($_REQUEST['file_id'])) ? serialize(array_values(array_filter($_REQUEST['file_id']))) : 'a:0:{}';

        $record->status     = 0;
        $record->sortorder  = Useranswer::find_maximum();
        $record->added_date = registered();

        $db->begin();
        if ($record->save()):
            $db->query("UPDATE tbl_user_questions SET status=1 WHERE id='{$_REQUEST['q_id']}'");
            $db->commit();

            echo json_encode(array('action' => 'success', 'message' => 'Successfully Answered !!!'));
            $uInfo = Member::find_by_id($_REQUEST['user_id']);
            log_action("Question From [" . $uInfo->name . "] answered", 1, 3);
        else:
            $db->rollback();
            echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['unableToSave']));
        endif;
    break;

    case "editAnswer":
        $record             = Useranswer::find_by_id($_REQUEST['idValue']);

        $record->q_id       = $_REQUEST['q_id'];
        $record->user_id    = $_REQUEST['user_id'];
        $record->admin_id   = $_REQUEST['admin_id'];
        $record->answer     = !empty($_REQUEST['answer']) ? $_REQUEST['answer'] : '';
        $record->file_id    = (!empty($_REQUEST['file_id'])) ? serialize(array_values(array_filter($_REQUEST['file_id']))) : 'a:0:{}';

        $record->status     = 0;
        $record->added_date = registered();

        $db->begin();
        if ($record->save()):
            $db->query("UPDATE tbl_user_questions SET status=1 WHERE id='{$_REQUEST['q_id']}'");
            $db->commit();

            echo json_encode(array('action' => 'success', 'message' => 'Successfully Answered !!!'));
            $uInfo = Member::find_by_id($_REQUEST['user_id']);
            log_action("Question From [" . $uInfo->name . "] answered", 1, 4);
        else:
            $db->rollback();
            echo json_encode(array("action" => "notice", "message" => $GLOBALS['basic']['noChanges']));
        endif;
    break;
}
?>