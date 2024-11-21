<?php
require_once("includes/initialize.php");

$lang       = !empty($session->get('lang_type')) ? $session->get('lang_type') : 'gr';

$usermail   = User::get_UseremailAddress_byId(1);
//$usermail   = 'swarna@longtail.info';
$ccusermail = User::field_by_id(1, 'optional_email');
$sitename   = Config::getField('sitename', true);

foreach ($_POST as $key => $val) {$$key = $val;}

if ($_POST['action'] == "forcomment"):
    $body = '
	<table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
	  <tr>
		<td><p>Dear Sir,</p>
		</td>
	  </tr>
	  <tr>
		<td><p><span style="color:#0065B3; font-size:14px; font-weight:bold">Comment message</span><br />
		  The details provided are:</p>
		  <p><strong>Fullname</strong> : ' . $name . '<br />		
		  <strong>E-mail Address</strong>: ' . $email . '<br />
		  <strong>Phone</strong>: ' . $phone . '<br />
		  <strong>Message</strong>: ' . $message . '<br />
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

    $mail = new PHPMailer(); // defaults to using php "mail()"

    $mail->CharSet = 'UTF-8';
    $mail->SetFrom($email, $name);
    $mail->AddReplyTo($email, $name);

    $mail->AddAddress($usermail, $sitename);
    if (!empty($ccusermail)) {
        $rec = explode(';', $ccusermail);
        if ($rec) {
            foreach ($rec as $row) {
                $mail->AddCC($row, $sitename);
            }
        }
    }

    $mail->Subject = 'Enquiry mail from ' . $name;

    $mail->MsgHTML($body);

    if (!$mail->Send()) {
        echo json_encode(array("action" => "unsuccess", "message" => "We could not sent your request at the time. Please try again later."));
    } else {
        $msg = "Your request has been successfully received, You will be shortly informed through mail with you verified by admin.";
        echo json_encode(array("action" => "success", "message" => $msg));
    }
endif;

if ($_POST['action'] == "foroffer"):
    $body = '
	<table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
	  <tr>
		<td><p>Dear Sir,</p>
		</td>
	  </tr>
	  <tr>
		<td><p><span style="color:#0065B3; font-size:14px; font-weight:bold">Offer enquiry message</span><br />
		  The details provided are:</p>
		  <p><strong>Full Name</strong> : ' . $fullname . '<br />		
		  <strong>Offer</strong>: ' . $offername . '<br />
		  <strong>E-mail Address</strong>: ' . $email . '<br />
		  <strong>Phone</strong>: ' . $phone . '<br />
		  <strong>Message</strong>: ' . $message . '<br />
		  </p>
		</td>
	  </tr>
	  <tr>
		<td><p>&nbsp;</p>
		<p>Thank you,<br />
		' . $fullname . '
		</p></td>
	  </tr>
	</table>
	';

    $mail = new PHPMailer(); // defaults to using php "mail()"

    $mail->CharSet = 'UTF-8';
    $mail->SetFrom($email, $fullname);
    $mail->AddReplyTo($email, $fullname);

    $mail->AddAddress($usermail, $sitename);
    if (!empty($ccusermail)) {
        $rec = explode(';', $ccusermail);
        if ($rec) {
            foreach ($rec as $row) {
                $mail->AddCC($row, $sitename);
            }
        }
    }

    $mail->Subject = 'Offer enquiry mail from ' . $fullname;

    $mail->MsgHTML($body);

    if (!$mail->Send()) {
        echo json_encode(array("action" => "unsuccess", "message" => "We could not sent your request at the time. Please try again later."));
    } else {
        $msg = "Your request has been successfully received, You will be shortly informed through mail with you verified by admin.";
        echo json_encode(array("action" => "success", "message" => $msg));
    }
endif;
?>