<?php
require_once("../initialize.php");

if ($_POST['action'] == "forcomment"):

    $usermail = User::get_UseremailAddress_byId(1);
//    $usermail = "swarna@longtail.info";
    $ccusermail = User::field_by_id(1, 'optional_email');
    $sitename = Config::getField('sitename', true);

    $name = $record->first_name . ' ' . $record->last_name;

    $body = '
	<table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
	  <tr>
		<td><p>Dear Sir,</p>
		</td>
	  </tr>
	  <tr>
		<td><p><span style="color:#0065B3; font-size:14px; font-weight:bold">Thank you for creating an account with us !!</span><br />
		  The details provided are:</p>
		  <p>
		  <strong>First Name</strong> : ' . $record->first_name . '<br />		
		  <strong>Last Name</strong> : ' . $record->last_name . '<br />		
		  <strong>E-mail Address</strong>: ' . $record->email . '<br />
		  <strong>Phone</strong>: ' . $record->contact . '<br />
		  <strong>Address</strong>: ' . $record->facebook_uid . '<br />
		  </p>
		</td>
	  </tr>
	  <tr>
		<td><p>&nbsp;</p>
		<p>Thank you,<br />
		' . $name . '
		</p></td>
	  </tr>
	</table>
	';

    /*
    * mail info
    */

    $mail = new PHPMailer(); // defaults to using php "mail()"

    //    $mail->CharSet = 'UTF-8';

    $mail->IsSMTP();
    $mail->SMTPAuth     = true;
    $mail->SMTPSecure   = "ssl";
    $mail->Host         = "mail.sulavhealth.com";
    $mail->Port         = "465";
    $mail->Username     = 'smtp@sulavhealth.com';
    $mail->Password     = 'G4coCsdHj.Ay';
    
    $mail->SetFrom($usermail, $sitename);
    $mail->AddReplyTo($usermail, $sitename);
    $mail->AddAddress($record->email, $name);
    $mail->Subject = 'Account Creation in ' . $sitename;

    $mail->MsgHTML($body);

    @$mail->Send();

endif;
