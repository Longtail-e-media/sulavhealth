<?php

/**
 *          Reset Password Form
 */
$resetpassword = '';

if (defined('RESET_PASSWORD_PAGE')) {
    $token = $_REQUEST['access_code'];
    $user = Member::get_uid_by_accessToken($token);

    if (!empty($user)) {
        $resetpassword .= '
        <form class="form-horizontal register-form" id="resetPasswordForm" action="" method="POST">
            <input type="hidden" name="id" value="' . $user->id . '">
            <input type="hidden" name="token" value="' . $token . '">
        
            <div class="form-group">
                <label for="password" class="col-md-6 control-label">New Password</label>
                <div class="">
                    <input id="password" type="password" class="form-control" name="password">
                    <span toggle="#password" class="fa fa-fw fa-eye field-icon password"></span>
                </div>
            </div>
        
            <div class="form-group">
                <label for="confirm_password" class="col-md-6 control-label">Retype Password</label>
                <div class="">
                    <input id="confirm_password" type="password" class="form-control" name="confirm_password">
                    <span toggle="#confirm_password" class="fa fa-fw fa-eye field-icon confirm_password"></span>
                </div>
            </div>
        
            <fieldset class="form-group">
                <button type="submit" class="btn btn-primary btn-block" id="btn-submit">Update <i class="fa fa-sign-in-alt"></i></button>
            </fieldset>
        
        </form>
        ';
    } else {
        redirect_to(BASE_URL . 'user/login');
    }

}

$jVars['module:member:password-resetform'] = $resetpassword;


/**
 *          User Dashboard side menu and top bar
 */
$user_side_bar = $user_top_bar = '';

if (isset($_SESSION['user_id'])) {
    $userid = $_SESSION['user_id'];
    $extUser = Member::find_by_id($userid);
    if (!empty($extUser) and $extUser->status == 1) {
        $user_side_bar .= '
            <div class="app-sidebar-wrapper">
                <div class="app-sidebar sidebar-shadow">
                    <div class="scrollbar-sidebar scrollbar-container">
                        <div class="app-sidebar__inner">
                            <ul class="vertical-nav-menu">
                                <li>
                                    <a href="' . BASE_URL . 'user/dashboard">
                                        <img src="' . BASE_URL . 'template/web/user/images/dash.png">
                                        Dashboard / Question Form
                                    </a>
                                </li>
                                <li>
                                    <a href="' . BASE_URL . 'user/qna">
                                        <img src="' . BASE_URL . 'template/web/user/images/question.png">
                                        Questions / Answers
                                    </a>
                                </li>
                                <li>
                                    <a href="' . BASE_URL . 'user/files">
                                        <img src="' . BASE_URL . 'template/web/user/images/file.png">
                                        Files
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        ';

        $sql = "SELECT id FROM tbl_user_answers WHERE user_id='$userid' AND status=0";
        $tot = $db->num_rows($db->query($sql));
        $color = ($tot > 0) ? 'color: red' : '';

        $user_top_bar .= '
            <div class="app-header">
                <div class="page-title-heading">
                    Welcome to Quality and Sustainable Development Consultants
                </div>
                <div class="app-header-right">
                    <div class="header-btn-lg pr-0">
                        <div class="header-dots">
                            <a href="' . BASE_URL . 'user/qna">
                                <div class="dropdown">
                                    <i class="far fa-bell notifColor" style="' . $color . '"></i>
                                    <!--<span class="badge badge-dot badge-dot-sm badge-danger">Notification</span>-->
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="header-btn-lg pr-0">
                        <div class="widget-content p-0">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left">
                                    <div class="btn-group">
                                        <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0 btn">
                                        ';
        $img = BASE_URL . 'template/web/user/images/sample.png';
        $file_path = SITE_ROOT . 'images/member/' . $extUser->image;
        if (file_exists($file_path) and !empty($extUser->image)) {
            $img = IMAGE_PATH . 'member/' . $extUser->image;
        }
        $user_top_bar .= '
                                            <img width="42" class="rounded" src="' . $img . '" alt="' . $extUser->name . '">
                                            <i class="far fa-chevron-down ml-2 opacity-8"></i>
                                        </a>
                                        <div tabindex="-1" role="menu" aria-hidden="true"
                                             class="rm-pointers dropdown-menu-lg dropdown-menu dropdown-menu-right" x-placement="bottom-end"
                                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-293px, 44px, 0px);">
                                            <div class="dropdown-menu-header">
                                                <div class="dropdown-menu-header-inner bg-info">
                                                    <div class="menu-header-content text-left">
                                                        <div class="widget-content p-0">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left mr-3">
                                                                    <img width="42" class="rounded-circle" src="' . $img . '" alt="' . $extUser->name . '">
                                                                </div>
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">' . $extUser->name . '
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="scroll-area-xs" style="height: 75px;">
                                                <div class="scrollbar-container ps ps--active-y">
                                                    <ul class="nav flex-column">
                                                        <li class="nav-item">
                                                            <a href="' . BASE_URL . 'user/profile" class="nav-link">Edit Profile
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="' . BASE_URL . 'user/logout" class="nav-link">Logout
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        
                <div class="app-header-overlay d-none animated fadeIn"></div>
            </div>    
        ';
    }
}

$jVars['module:member:side-bar'] = $user_side_bar;
$jVars['module:member:top-bar'] = $user_top_bar;


/**
 *          User Profile Page
 */
$user_profile_form = '';

if (defined('USER_PROFILE_PAGE')) {
    if (isset($_SESSION['user_id']) AND isset($_SESSION['user_id']) > 0) {
        $userid = $session->get('user_id');
        $extUser = Member::find_by_id($userid);
        if (!empty($extUser) and $extUser->status == 1) {
            $user_profile_form .= '
                <form id="profileForm">
                    <div class="modal-dialog w-100">
                        <div class="modal-content">
                            <div class="modal-body">
                                <h4 class="mt-2">Edit your profile</h4>
                                <div class="divider row"></div>
                                <div class="form-row">
                                    <div class="my-msg"></div>
                                    <input type="hidden" name="idValue" value="' . $extUser->id . '">
                                    <div class="col-md-12">
                                        <div class="position-relative form-group">
                                            <input name="name" id="name" placeholder="Your Name" value="' . $extUser->name . '" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="position-relative form-group">
                                            <input name="email" id="email" placeholder="Your Email" readonly value="' . $extUser->email . '" type="email" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="position-relative form-group">
                                            <input name="phone" id="phone" placeholder="Phone No." value="' . $extUser->phone . '" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="position-relative form-group">
                                            <input name="password" id="password" placeholder="Password" type="password" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="position-relative form-group">
                                            <input name="confirm_password" id="confirm_password" placeholder="Confirm Password" type="password" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="position-relative form-group">
                                            <label for="img">Select image: </label>
                                            <input type="file" id="img" name="img" accept="image/*">
                                            ';

            if (!empty($extUser->image)) {
                $user_profile_form .= '
                    <div class="col-md-4" id="removeSavedimg1">
                        <div class="infobox info-bg">
                            <div class="button-group" data-toggle="buttons">
                                <a class="btn small float-right" href="javascript:void(0);" onclick="deleteSavedimage(1);">
                                    <i class="glyph-icon icon-trash-o"></i>
                                </a>
                            </div>
                            <img src="' . IMAGE_PATH . 'member/thumbnails/' . $extUser->image . '" style="width:100%"/>
                            <input type="hidden" name="imageArrayname" value="' . $extUser->image . '" class=""/>
                        </div>
                    </div>
                ';
            }

            $user_profile_form .= '
                                            <div id="preview_Image" class="mt-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer d-block text-center">
                                <button type="submit" id="submit" class="btn-wide btn-pill btn-hover-shine btn btn-primary btn-lg">Update Profile</button>
                            </div>
                        </div>
                    </div>
                </form>
            ';
        } else {
            redirect_to(BASE_URL . 'user/login/');
        }
    } else {
        redirect_to(BASE_URL . 'user/login/');
    }
}

$jVars['module:member:profile-form'] = $user_profile_form;


/**
 *          User Dashboard
 */
$user_question_form = $user_question_list = '';

if (defined('DASHBOARD_PAGE')) {
    if (isset($_SESSION['user_id']) AND isset($_SESSION['user_id']) > 0) {
        $userid = $session->get('user_id');
        $extUser = Member::find_by_id($userid);
        if (!empty($extUser) and $extUser->status == 1) {
            $user_question_form .= '
                <form class="" id="questionForm">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="position-relative form-group">
                                <p>Please type your question below</p>
                                <textarea name="question" placeholder="Write Questions..."></textarea>
                            </div>
                            <input type="hidden" name="user_id" value="' . $userid . '">
                            <button type="submit" id="submit" class="mt-2 btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
            ';

            $questions = Userquestion::find_all($userid);
            if (!empty($questions)) {
                $user_question_list .= '
<div class="app-inner-bar app-inner-bar1">
    <div class="container-fluid">
        <div class="main-card card">
            <div class="row">
                <div class="col-lg-12">
                    <div class="main-card card bardy">
                        <h5 class="card-title">Questions Submitted</h5>
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                            <thead>
                                <tr class="">                   
                                   <th>S.N</th>
                                   <th>Question</th>
                                   <th>Date/Time</th>
                                </tr>
                            </thead>
                            <tbody>
                ';
                foreach ($questions as $i => $question) {
                    $user_question_list .= '
                        <tr>
                            <td>' . ($i + 1) . '</td>
                            <td>' . $question->question . '</td>
                            <td>' . $question->added_date . '</td>
                        </tr>
                    ';
                }
                $user_question_list .= '
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                ';
            }
        } else {
            redirect_to(BASE_URL . 'user/login/');
        }
    } else {
        redirect_to(BASE_URL . 'user/login/');
    }
}

$jVars['module:member:dashboard-question-form'] = $user_question_form;
$jVars['module:member:dashboard-question-list'] = $user_question_list;


/**
 *          User Answers
 */
$user_answer_list = '';

if (defined('QNA_PAGE')) {
    if (isset($_SESSION['user_id']) AND isset($_SESSION['user_id']) > 0) {
        $userid = $session->get('user_id');
        $extUser = Member::find_by_id($userid);
        if (!empty($extUser) and $extUser->status == 1) {
            $sql = "UPDATE tbl_user_answers SET status=1 WHERE user_id='$userid'";
            $db->query($sql);
            $user_answer_list .= '<style>.notifColor{color: black !important;}</style>';

            $questions = Userquestion::find_all_desc($userid);
            if (!empty($questions)) {
                $user_answer_list .= '
                    <div id="accordion" class="accordion-wrapper mb-3">
                ';
                foreach ($questions as $k => $question) {
                    $aria = ($k == 0) ? 'true' : 'false';
                    $collapsed = ($k == 0) ? '' : 'collapsed';
                    $show = ($k == 0) ? 'show' : '';
                    $user_answer_list .= '
                        <div class="">
                            <div id="heading' . $question->id . '" class="card-header">
                                <button type="button" data-toggle="collapse" data-target="#collapse' . $question->id . '" aria-expanded="' . $aria . '"
                                        aria-controls="collapse' . $question->id . '" class="text-left m-0 p-0 btn btn-link btn-block ' . $collapsed . '">
                                    <h5 class="m-0 p-0">' . ($k + 1) . '. ' . $question->question . '</h5>
                                </button>
                            </div>
                            <div data-parent="#accordion" id="collapse' . $question->id . '" aria-labelledby="heading' . $question->id . '" class="collapse ' . $show . '" style="">
                                <div class="card-body">
                                ';

                    $answer = Useranswer::find_by_user_question_id($userid, $question->id);
                    if (!empty($answer)) {
                        $user_answer_list .= '
                            <p>' . $answer->answer . '</p>
                        ';
                        if ($answer->file_id != 'a:0:{}') {
                            $file_arr = unserialize($answer->file_id);
                            if (!empty($file_arr) and is_array($file_arr)) {
                                $user_answer_list .= '
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table class="table table-hover table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>SN</th>
                                                        <th>File Name</th>
                                                        <th>Download</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                ';
                                foreach ($file_arr as $i => $val) {
                                    $file = File::find_by_id($val);
                                    $user_answer_list .= '
                                        <tr>
                                            <td>' . ($i + 1) . '</td>
                                            <td>' . $file->title . '</td>
                                            <td style="cursor:pointer">
                                                <a href="' . IMAGE_PATH . 'file/' . $file->file . '" target="_blank"><i class="far fa-download"></i> Download</a>
                                            </td>
                                        </tr>
                                    ';
                                }
                                $user_answer_list .= '
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                ';
                            }
                        }
                    } else {
                        $user_answer_list .= '<p>No answer yet</p>';
                    }

                    $user_answer_list .= '
                                </div>
                            </div>
                        </div>
                    ';
                }
                $user_answer_list .= '
                    </div>
                ';
            } else {
                $user_answer_list .= '
                    <div class="mb-3 text-center"><h3>No Questions Asked</h3></div>
                ';
            }
        } else {
            redirect_to(BASE_URL . 'user/login/');
        }
    } else {
        redirect_to(BASE_URL . 'user/login/');
    }
}

$jVars['module:member:answer-list'] = $user_answer_list;


/**
 *          User Files
 */
$user_files = '';

if (defined('FILES_PAGE')) {
    if (isset($_SESSION['user_id']) AND isset($_SESSION['user_id']) > 0) {
        $userid = $session->get('user_id');
        $extUser = Member::find_by_id($userid);
        if (!empty($extUser) and $extUser->status == 1) {
            $user_files .= '<style>.notifColor{color: black !important;}</style>';

            $sql = "SELECT file_id FROM tbl_user_answers WHERE user_id=$userid";
            $total = $db->num_rows($db->query($sql));
            $query = $db->query($sql);
            $allFiles = array();
            if ($total > 0) {
                while ($res = $db->fetch_object($query)) {
                    $unseri = unserialize($res->file_id);
                    if (!empty($unseri) and is_array($unseri)) {
                        foreach ($unseri as $unser) {
                            if (!in_array($unser, $allFiles)) {
                                $allFiles[] = $unser;
                            }
                        }
                    }
                }
                asort($allFiles);
            }

            if (!empty($allFiles)) {
                $user_files .= '
                    <table class="table table-hover table-striped table-bordered" id="example">
                        <thead>
                            <tr>
                                <th>SN</th>
                                <th>File Name</th>
                                <th>Download</th>
                            </tr>
                        </thead>
                        <tbody>
                ';
                foreach ($allFiles as $k => $allFile) {
                    $file = File::find_by_id($allFile);
                    if(!empty($file)){
                        $user_files .= '
                            <tr>
                                <td>' . ($k + 1) . '</td>
                                <td>'.$file->title.'</td>
                                <td style="cursor:pointer">
                                    <a href="' . IMAGE_PATH . 'file/' . $file->file . '" target="_blank"><i class="far fa-download"></i> Download</a>
                                </td>
                            </tr>
                        ';
                    }
                }
                $user_files .= '
                        </tbody>
                    </table>
                ';
            } else {
                $user_files .= '
                    <h3 class="text-center">No File Found</h3>
                ';
            }
        } else {
            redirect_to(BASE_URL . 'user/login/');
        }
    } else {
        redirect_to(BASE_URL . 'user/login/');
    }
}

$jVars['module:member:file-list'] = $user_files;