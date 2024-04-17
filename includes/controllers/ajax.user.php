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

    $lang = !empty($session->get('lang_type')) ? $session->get('lang_type') : 'gr';

	$action = $_REQUEST['action'];

	switch($action)
	{
		case "addNewUser":
			$record = new User();

			$record->first_name 	= $_REQUEST['first_name'];
			$record->middle_name	= $_REQUEST['middle_name'];
			$record->last_name		= $_REQUEST['last_name'];
			$record->email			= $_REQUEST['email'];
			$record->optional_email = $_REQUEST['optional_email'];
			$record->username		= $_REQUEST['username'];
			$record->password		= md5($_REQUEST['password']);
			$record->accesskey		= @randomKeys(25);
			$record->group_id		= $_REQUEST['field_type'];
			$record->status			= $_REQUEST['status'];
			$record->sortorder		= User::find_maximum();
			$record->added_date 	= registered();

			$checkDupliUname=User::checkDupliUname($record->username);
			if($checkDupliUname):
				echo json_encode(array("action"=>"warning","message"=>"Username Already Exists."));
				exit;
			endif;
			$db->begin();
			if($record->save()): $db->commit();
				$message  = sprintf($GLOBALS['basic']['addedSuccess_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			    echo json_encode(array("action"=>"success","message"=>$message));
				log_action("User [".$record->first_name." ".$record->middle_name." ".$record->last_name."] login Created ".$GLOBALS['basic']['addedSuccess'],1,3);
			else: $db->rollback(); echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
			endif;
		break;

		case "editNewUser":
			$record = User::find_by_id($_REQUEST['idValue']);

			$record->first_name 	= $_REQUEST['first_name'];
			$record->middle_name	= $_REQUEST['middle_name'];
			$record->last_name		= $_REQUEST['last_name'];
			$record->email			= $_REQUEST['email'];
			$record->optional_email = $_REQUEST['optional_email'];
			$record->accesskey		= @randomKeys(25);
			if($record->username!=$_REQUEST['username']){
				$checkDupliUname=User::checkDupliUname($_REQUEST['username']);
				if($checkDupliUname):
					echo json_encode(array("action"=>"warning","message"=>"Username Already Exists."));
					exit;
				endif;
			}

			$record->username	= $_REQUEST['username'];
			$record->status		= $_REQUEST['status'];
			$record->group_id	= $_REQUEST['field_type'];
			if(!empty($_REQUEST['password']))
			$record->password	= md5($_REQUEST['password']);
			$db->begin();
			if($record->save()):$db->commit();
			   $message  = sprintf($GLOBALS['basic']['changesSaved_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			    echo json_encode(array("action"=>"success","message"=>$message));
			   log_action("User [".$record->first_name." ".$record->middle_name." ".$record->last_name."] Edit Successfully",1,4);
			else: $db->rollback(); echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
			endif;
		break;

		case "userPermission":
			$record = User::find_by_id($_REQUEST['idValue']);

			$module_id = !empty($_REQUEST['module_id'])?$_REQUEST['module_id']:array();
			$record->permission = serialize($module_id);

			$db->begin();
			if($record->save()):$db->commit();
			   $message  = sprintf($GLOBALS['basic']['changesSaved_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			    echo json_encode(array("action"=>"success","message"=>$message));
			   log_action("User [".$record->first_name." ".$record->middle_name." ".$record->last_name."] Edit Successfully",1,4);
			else: $db->rollback(); echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
			endif;
		break;

		case "delete":
			$id = $_REQUEST['id'];
			$record = User::find_by_id($id);
			$db->begin();
			$res = $db->query("DELETE FROM tbl_users WHERE id='{$id}'");
			if($res):$db->commit();	else: $db->rollback();endif;
			reOrder("tbl_users", "sortorder");

			$message  = sprintf($GLOBALS['basic']['deletedSuccess_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			echo json_encode(array("action"=>"success","message"=>$message));
			log_action("Question Category  [".$record->first_name.' '.$record->middle_name.' '.$record->last_name."]".$GLOBALS['basic']['deletedSuccess'],1,6);
		break;

		// Module Setting Sections  >> <<
		case "toggleStatus":
			$id = $_REQUEST['id'];
			$record = User::find_by_id($id);
			$record->status = ($record->status == 1) ? 0 : 1 ;
			$db->begin();
			$res = $record->save();
			if($res):$db->commit();	else: $db->rollback();endif;
			echo "";
		break;
		case "sortbyadmin":
			$id 	= $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
			$order	= ($_REQUEST['toPosition']==1)?0:$_REQUEST['toPosition'];// IS a line containing sortorder
			$db->begin();
			$res = $db->query("UPDATE tbl_users SET sortorder=".$order." WHERE id=".$id." ");
			if($res):$db->commit();	else: $db->rollback();endif;
			reOrder("tbl_users", "sortorder");
			$message  = sprintf($GLOBALS['basic']['sorted_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			echo json_encode(array("action"=>"success","message"=>$message));
		break;

		case "checkLogin":
			$session->start();
			$uname    = addslashes($_REQUEST['username']);
			$password = addslashes($_REQUEST['password']) ;

			$found_user = User::authenticateAdmin($uname, md5($password));

			// ** check the number of login attempts
			$_SESSION['countrials'] = (isset($_SESSION['countrials'])) ? $_SESSION['countrials']+1 : 1;
			if($found_user):

				$session->set('u_id',$found_user->id);
				$session->set('acc_ip',$_SERVER['REMOTE_ADDR']);
				$session->set('acc_agent',$_SERVER['HTTP_USER_AGENT']);
				$session->set('loginUser',$found_user->first_name.' '.$found_user->middle_name.' '.$found_user->last_name);
				$session->set('accesskey',$found_user->accesskey);

				$preId = Config::getconfig_info();
				log_action($GLOBALS['login']['login'].$session->get('loginUser').$GLOBALS['login']['loggedIn'],1,1);
				echo json_encode(array("action"=>"success","pgaction"=>$preId->action));
			else:
				echo json_encode(array("action"=>"unsuccess","message"=>"Uername Or Password Not Match "));
			endif;
		break;

		case "changepassword":
			$record = User::find_by_id($_REQUEST['idValue']);

			if(!empty($_REQUEST['password']))
			$record->password	= md5($_REQUEST['password']);
			$db->begin();
			if($record->save()): $db->commit();
				$message  = sprintf($GLOBALS['basic']['changesSaved_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			    echo json_encode(array("action"=>"success","message"=>$message));
			else: $db->rollback();echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
			endif;
		break;

		case "forgetuser_password":
			$emailAddress  = addslashes($_REQUEST['mailaddress']);
			$mailcheck     = User::get_validMember_mail($emailAddress);

			if($mailcheck):
				$accessToken = randomKeys(10);
				$row = User::find_by_mail($emailAddress);

				$forgetRec	 = User::find_by_id($row->id);
				$forgetRec->access_code = $accessToken;

				/* Mail Format */
				$siteName   = Config::getField('sitename',true);
				$AdminEmail = User::get_UseremailAddress_byId(1);
				$UserName	= User::get_user_shotInfo_byId($row->id);
				$fullName	= $UserName->first_name.' '.$UserName->middle_name.' '.$UserName->last_name;

				$msgbody = '<div>
				<h3>Reset password on '.$siteName.'</h3>				
				<div><font face="Trebuchet MS">Dear '.$fullName.' !</font> <br /><br><br>
				Please <a href="'.ADMIN_URL.'resetpassword-'.$accessToken.'">click here to reset your password.</a> <br><br>
				If you didn\'t request your password then delete this email.  <br>
				<br><br>
				<p>Thanks,
				<br> Webmaster<br>
				'.$siteName.'
				</p>
				</div>
				</div>';

				 $mail = new PHPMailer();

				 $mail->SetFrom($AdminEmail,$siteName);
				 $mail->AddReplyTo($forgetRec->email,$fullName);
				 $mail->AddAddress($forgetRec->email,$fullName);
				 $mail->Subject    = "Forgot password on ".$siteName;
				 $mail->MsgHTML($msgbody);

				if(!$mail->Send()):
					echo json_encode(array('action'=>'unsuccess','message'=>'Not valid User email address'));
				else:
					$forgetRec->save();
					echo json_encode(array('action'=>'success','message'=>'Please check your mail for reset passord'));
				endif;
			else:
				echo json_encode(array('action'=>'unsuccess','message'=>'Not valid User email address'));
			endif;
		break;

		case "resetuser_password":
			$id = addslashes($_REQUEST['userId']);
			$record = User::find_by_id($id);
			$record->password = md5($_REQUEST['password']);
			$record->access_code = randomKeys(10);
			if($record->save()):
				echo json_encode(array('action'=>'success','message'=>'Password has been changed, please login!'));
			else:
				echo json_encode(array('action'=>'unsuccess','message'=>'Internal error.'));
			endif;
		break;

		// Front User
        case "registerNewUser":
            $record = new User();

            $record->first_name     = $_REQUEST['fname'];
            $record->last_name      = $_REQUEST['lname'];
            $record->email          = $_REQUEST['email'];
            $record->contact        = $_REQUEST['phone'];
            $record->facebook_uid   = $_REQUEST['address'];
            $record->password       = md5($_REQUEST['password']);
            $record->accesskey      = @randomKeys(25);
            $record->group_id		= 2;
            $record->status         = 1;
            $record->sortorder      = User::find_maximum();


            $checkDupliEmail        = User::checkDupliEmail($record->email);
            if ($checkDupliEmail):
                $message = ($lang == "gr") ? "Αυτό το email υπάρχει ήδη." : "This email already exists.";
                echo json_encode(array("action" => "warning", "message" => $message));
                exit;
            endif;

            $db->begin();
            if ($record->save()): $db->commit();
                $message = ($lang == "gr") ? "Η εγγραφή σας ήταν επιτυχής, θα ανακατευθυνθείτε στη σελίδα σύνδεσης!" : "Your registration is successful, you will be redirected to Login page!";
                echo json_encode(array('action' => 'success', 'message' => $message ));
                log_action("User [" . $record->first_name . " " . $record->last_name . "] login Created " . $GLOBALS['basic']['addedSuccess'], 1, 3);
            else:
                $message = ($lang == "gr") ? "Λάθος συστήματος!" : "Internal error!";
                echo json_encode(array('action' => 'unsuccess', 'message' => $message));
            endif;
        break;

        case "updateProfileUser":
            $record                 = User::find_by_id($_REQUEST['idValue']);
            $record->first_name     = $_REQUEST['fname'];
            $record->last_name      = $_REQUEST['lname'];
            $record->email          = $_REQUEST['email'];
            $record->facebook_uid   = $_REQUEST['address'];
            $record->contact        = $_REQUEST['phone'];
            $record->password       = (!empty($_REQUEST['password'])) ? md5($_REQUEST['password']) : $record->password;
            $record->accesskey      = @randomKeys(25);
            $record->status         = 1;

            $db->begin();
            if ($record->save()): $db->commit();
                $message = ($lang == "gr")
                    ? 'Οι αλλαγές του χρήστη \'' . $record->first_name . ' ' . $record->last_name . '\' ολοκληρώθηκαν επιτυχώς.'
                    : 'Changes on User \'' . $record->first_name . ' ' . $record->last_name . '\' has been saved successfully.';

                echo json_encode(array("action" => "success", "message" => $message));
                log_action("User [" . $record->first_name . " ".$record->last_name."] Edit Successfully", 1, 4);
            else: $db->rollback();
                echo json_encode(array("action" => "error", "message" => $GLOBALS['basic']['noChanges']));
            endif;
        break;

        case "toggleApproved":
            $id = $_REQUEST['id'];
            $record = User::find_by_id($id);
            $fullname = $record->first_name." ".$record->last_name;

            if ($record->status != '1') {
                $record->status = ($record->status == 1) ? 0 : 1;

                $body = '
                <table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
		  			<tr><td><p>Dear ' . $fullname . ',</p></td></tr>
			  		<tr>
					    <td>    
                            <p>
                                <span style="color:#0065B3; font-size:14px; font-weight:bold">Your Account has been approved by ' . $sitename . '</span>
                                <br />The details provided are :
                            </p>
                            <p>				
                            <strong>Full Name</strong>: ' . $fullname . '<br />
                            <strong>E-mail Address</strong>: ' . $record->email . '<br />
                            <strong>Phone Number</strong>: ' . $record->contact . '<br />
                            <strong>Address</strong>: ' . $record->facebook_uid . '<br />
                            <strong>Link</strong>: ' . BASE_URL . 'login</p>
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
                    $db->begin(); $record->save(); $db->commit();
                    $message = "User " . $fullname . " has been approved and sent approve mail.";
                    echo json_encode(array("action" => "success", "message" => $message));
                }
            }
            else {
                $record->status = ($record->status == 1) ? 0 : 1;

                $body = '
                <table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
		  			<tr><td><p>Dear ' . $fullname . ',</p></td></tr>
			  		<tr>
					    <td>    
                            <p>
                                <span style="color:#0065B3; font-size:14px; font-weight:bold">Your Account has been deactivated by ' . $sitename . '</span>
                                <br />The login details provided are :
                            </p>
                            <p>
                            <strong>Full Name</strong> : ' . $fullname . '<br />				
                            <strong>E-mail Address</strong>: ' . $record->email . '<br />
                            <strong>Phone Number</strong>: ' . $record->contact . '<br />
                            <strong>Address</strong>: ' . $record->facebook_uid . '<br /><br />
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
                    $db->begin(); $record->save(); $db->commit();
                    $message = "User " . $fullname . " has been deactivated and sent mail.";
                    echo json_encode(array("action" => "success", "message" => $message));
                }
            }

        break;

        case "frontLogin":
            $email      = addslashes($_REQUEST['email']);
            $paccess    = addslashes($_REQUEST['password']);

            $sql = 'SELECT * FROM tbl_users WHERE email="' . $email . '"';
            $sql .= ' AND password="' . md5($paccess) . '" AND group_id=2 LIMIT 1';
            $count = $db->num_rows($db->query($sql));

            if ($count > 0) {
                $sqlid = $db->fetch_object($db->query($sql));
                $userid = $sqlid->id;
                $uprec = User::find_by_mail($email);

                if ($uprec->status == 0) {
                    $message = (($lang == "gr") ? "Ο λογαριασμός σας δεν εγκρίθηκε!" : "Your account has not been approved!");
                    echo json_encode(array("action" => "error", "message" => $message));
                } else {
                    $session->set('email_logged', $email);
                    $session->set('user_id', $userid);
                    $remember = isset($_REQUEST['remember']) ? 1 : 0;

                    if (!empty($remember)) {
                        setcookie("remem_email", $email, time() + (60 * 60), "/", NULL);
                        setcookie("remem_pass", $paccess, time() + (60 * 60), "/", NULL);
                    } else {
                        setcookie("remem_email", '', time() - (60 * 60), "/", NULL);
                        setcookie("remem_pass", '', time() - (60 * 60), "/", NULL);
                    }
                    $message = (($lang == "gr") ? "Καλωσόρισες " . $uprec->first_name . "! Σύντομα θα μεταφερθείς στον λογαριασμό σου!" : "Welcome " . $uprec->first_name . "! You will be redirected to Dashboard shortly!");
                    echo json_encode(array("action" => "success", "message" => $message));
                }
            } else {
                $message = (($lang == "gr") ? "Το email ή ο κωδικός σας είναι λάθος !" : "Email or Password doesn't match !");
                echo json_encode(array("action" => "error", "message" => $message));
            }
            break;

        case "forgotUserPassword":
            $emailAddress = addslashes($_REQUEST['email']);
            $mailcheck  = User::get_validMember_mail($emailAddress);

            if ($mailcheck):

                $row = User::find_by_mail($emailAddress);
                $forgetRec = User::find_by_id($row->id);
                $accessToken = @randomKeys(10);
                $forgetRec->access_code = $accessToken;

                /* Mail Format */
                $siteName       = Config::getField('sitename', true);
                $AdminEmail     = User::get_UseremailAddress_byId(1);
                $fullName       = $forgetRec->first_name." ".$forgetRec->last_name;

                $msgbody = '<div>
                <h3>Reset password on ' . $siteName . '</h3>                
                <div><font face="Trebuchet MS">Dear ' . $fullName . ' !</font> <br /><br><br>
                Please <a href="' . BASE_URL . 'reset-password/' . $accessToken . '">click here to reset your password.</a> <br><br>
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
                    $message = (($lang == "gr") ? "Μη έγκυρη ηλεκτρονική διεύθυνση χρήστη" : "Not valid User email address");
                    echo json_encode(array('action' => 'unsuccess', 'message' => $message));
                else:
                    $forgetRec->save();
                    $message = (($lang == "gr") ? "Παρακαλώ ελέγξτε το email σας για ανάκτηση κωδικού" : "Please check your mail for reset password");
                    echo json_encode(array('action' => 'success', 'message' => $message));
                endif;
            else:
                $message = (($lang == "gr") ? "Μη έγκυρη ηλεκτρονική διεύθυνση χρήστη" : "Not valid User email address");
                echo json_encode(array('action' => 'unsuccess', 'message' => $message));
            endif;
        break;

        case "resetUserPassword":
            $id                 = addslashes($_REQUEST['id']);
            $record             = User::find_by_id($id);
            $record->password   = md5($_REQUEST['password']);
            $record->access_code = @randomKeys(10);
            if ($record->save()):
                $message = ($lang == "gr") ? "Ο Κωδικός σας έχει αλλάξει, παρακαλώ συνδεθείτε!" : "Password has been changed, please login!";
                echo json_encode(array('action' => 'success', 'message' => $message));
            else:
                $message = ($lang == "gr") ? "Λάθος συστήματος!" : "Internal error!";
                echo json_encode(array('action' => 'unsuccess', 'message' => $message));
            endif;
        break;
	}
?>