<?php

/**
 *      Contact Page
 */

define("CONTACT_FORM_HEADING", ($lang == "gr")
    ? "Συμπληρώστε τη φόρμα και θα σας απαντήσουμε το συντομότερο δυνατό"
    : "Please complete this form and we will reply at our earliest convenience");

define("CONTACT_GIVE_FEEDBACK", ($lang == "gr") ? "Στείλτε το μήνυμά σας" : "Give Us your Feedback");
define("CONTACT_ENTER_NAME", ($lang == "gr") ? "Ονοματεπώνυμο" : "Enter your Name");
define("CONTACT_ENTER_EMAIL", ($lang == "gr") ? "Ηλεκτρονική Διεύθυνση" : "Enter Email Address");
define("CONTACT_ENTER_PHONE", ($lang == "gr") ? "Τηλέφωνο Επικοινωνίας" : "Enter Phone Number");
define("CONTACT_ENTER_MESSAGE", ($lang == "gr") ? "Το μήνυμά σας" : "Enter Message");

define("CONTACT_OFFICE_ADDRESS", ($lang == "gr") ? "Διεύθυνση" : "Office Address");
define("CONTACT_PHONE_NUMBER", ($lang == "gr") ? "Τηλέφωνο Επικοινωνίας" : "Phone Number");
define("CONTACT_EMAIL_ADDRESS", ($lang == "gr") ? "Email" : "Email Address");

define("CONTACT_FORM_FIRST_NAME", ($lang == "gr") ? "Όνομα" : "First Name");
define("CONTACT_FORM_LAST_NAME", ($lang == "gr") ? "Επίθετο" : "Last Name");
define("CONTACT_FORM_EMAIL_ADDRESS", ($lang == "gr") ? "Διεύθυνση Email" : "Enter email address");
define("CONTACT_FORM_PHONE", ($lang == "gr") ? "Τηλέφωνο" : "Add phone number");
define("CONTACT_FORM_MESSAGE", ($lang == "gr") ? "Μήνυμα" : "Enter messages");
define("CONTACT_FORM_SUBMIT", ($lang == "gr") ? "Υποβολή " : "Submit");

$jVars['module:common_language:CONTACT_FORM_SUBMIT'] = CONTACT_FORM_SUBMIT;

define("CONTACT_FORM_ERROR_FIRST_NAME", ($lang == "gr") ? "Συμπληρώστε το όνομά σας " : "Please enter your First Name.");
define("CONTACT_FORM_ERROR_LAST_NAME", ($lang == "gr") ? "Συμπληρώστε το επίθετό σας" : "Please enter your Last Name.");
define("CONTACT_FORM_ERROR_FULL_NAME", ($lang == "gr") ? "Συμπληρώστε το Ονοματεπώνυμο" : "Please enter your Full Name.");
define("CONTACT_FORM_ERROR_EMAIL", ($lang == "gr") ? "Συμπληρώστε το email σας" : "Please enter your Email Address.");
define("CONTACT_FORM_ERROR_PHONE", ($lang == "gr") ? "Συμπληρώστε τηλέφωνο επικοινωνίας" : "Please enter your Phone Number.");
define("CONTACT_FORM_ERROR_MESSAGE", ($lang == "gr") ? "Συμπληρώστε το μήνυμά σας" : "Please enter your message.");
define("CONTACT_FORM_ERROR_FIRST_NAME_MINIMUM", ($lang == "gr") ? "Το όνομα πρέπει να αποτελείται από τουλάχιστον 2 χαρακτήρες" : "Your name must consist of at least 2 characters.");
define("CONTACT_FORM_ERROR_EMAIL_CORRECT", ($lang == "gr") ? "Συμπληρώστε σωστή ηλεκτρονική διεύθυνση" : "Enter Correct Email Address!");
define("CONTACT_FORM_ERROR_PROCESSING", ($lang == "gr") ? "Σε εξέλιξη..." : "Processing...");

$jVars['module:common_language:CONTACT_FORM_ERROR_FIRST_NAME'] = CONTACT_FORM_ERROR_FIRST_NAME;
$jVars['module:common_language:CONTACT_FORM_ERROR_LAST_NAME'] = CONTACT_FORM_ERROR_LAST_NAME;
$jVars['module:common_language:CONTACT_FORM_ERROR_FULL_NAME'] = CONTACT_FORM_ERROR_FULL_NAME;
$jVars['module:common_language:CONTACT_FORM_ERROR_EMAIL'] = CONTACT_FORM_ERROR_EMAIL;
$jVars['module:common_language:CONTACT_FORM_ERROR_PHONE'] = CONTACT_FORM_ERROR_PHONE;
$jVars['module:common_language:CONTACT_FORM_ERROR_MESSAGE'] = CONTACT_FORM_ERROR_MESSAGE;
$jVars['module:common_language:CONTACT_FORM_ERROR_FIRST_NAME_MINIMUM'] = CONTACT_FORM_ERROR_FIRST_NAME_MINIMUM;
$jVars['module:common_language:CONTACT_FORM_ERROR_EMAIL_CORRECT'] = CONTACT_FORM_ERROR_EMAIL_CORRECT;
$jVars['module:common_language:CONTACT_FORM_ERROR_PROCESSING'] = CONTACT_FORM_ERROR_PROCESSING;


/**
 *      Header
 */

define("HEADER_CONTACT_US", ($lang == "gr") ? "Επικοινωνία" : "Contact Us");
define("HEADER_PHONE", ($lang == "gr") ? "Τηλ." : "Phone");
define("HEADER_LOGIN", ($lang == "gr") ? "Σύνδεση" : "Login");
define("HEADER_SIGNUP", ($lang == "gr") ? "Εγγραφή" : "Sign Up");


/**
 *      Footer
 */

define("FOOTER_OPERATION_MODE",
    ($lang == "gr")
        ? "<p><strong>ΚΑΝΟΝΙΣΜΟΣ ΛΕΙΤΟΥΡΓΙΑΣ</strong></p><ul><li>Το ιατρείο λειτουργεί μόνο κατόπιν προγραμματισμένου ραντεβού</li><li>Επείγοντα περιστατικά εξυπηρετούνται το συντομότερο δυνατόν</li></ul>"
        : "<p><strong>OPERATION MODE</strong></p><ul><li>The doctors office operates by appointment</li><li>Emergencies are served as soon as possible</li></ul>");
define("FOOTER_HEAD_OFFICE", ($lang == "gr") ? "Κεντρικά Γραφεία" : "Head Office");
define("FOOTER_LOCATION", ($lang == "gr") ? "Τοποθεσία" : "Location");
define("FOOTER_VIEW_LOCATION", ($lang == "gr") ? "Δείτε την τοποθεσία" : "View Location");
define("FOOTER_USEFUL_LINKS", ($lang == "gr") ? "Χρήσιμοι Σύνδεσμοι" : "Useful Links");
define("FOOTER_FREE_ASSESSMENT", ($lang == "gr") ? "Καλέστε μας για ανάλυση αναγκών" : "Request for FREE Assessment");
define("FOOTER_RESERVE", ($lang == "gr") ? "Επικοινωνία" : "Reserve");


/**
 *      Package Page
 */
define("PACKAGE_READ_MORE", ($lang == "gr") ? "Διαβάστε Περισσότερα" : "Read more");
define("PACKAGE_EXPRESSION_OF_INTEREST", ($lang == "gr") ? "Εκδήλωση Ενδιαφέροντος" : "Expression of Interest");

define("BROKEN_EXPRESSION_OF_INTEREST", ($lang == "gr")
    ? "Εκδήλωση 
    Ενδιαφέροντος"
    : "Expression 
       of 
    Interest");


/**
 *      Homepage
 */
define("HOME_COOKIES", ($lang == "gr") ? "Χρησιμοποιούμε cookies για να αποθηκεύσουμε μερικές από τις πληροφορίες σας και για την καλύτερη εμπειρία στη σελίδα μας. Κάνοντας κλικ στο \"Αποδέχομαι\" θα επιτρέψετε τη χρήση των cookies." : "We use cookies to store some of your information and for best experience on our page. By clicking \"I Accept\" you will allow the use of cookies.");
define("HOME_COOKIES_ACCEPT", ($lang == "gr") ? "Αποδέχομαι" : "I Accept");
define("HOME_OUR_SERVICES", ($lang == "gr") ? "Οι υπηρεσίες μας" : "Our services");
define("HOME_LEARN_MORE", ($lang == "gr") ? "Μάθετε περισσότερα" : "Learn More");

$jVars['module:common_language:HOME_COOKIES'] = HOME_COOKIES;
$jVars['module:common_language:HOME_COOKIES_ACCEPT'] = HOME_COOKIES_ACCEPT;
$jVars['module:common_language:HOME_OUR_SERVICES'] = HOME_OUR_SERVICES;


/**
 *      Interest Form Page
 */

define("INTEREST_FORM_INTERESTED", ($lang == "gr") ? "Ενδιαφέρομαι για τις υπηρεσίες σας" : "I am interested in your services");
define("INTEREST_FORM_CHOOSE", ($lang == "gr") ? "Επιλέξτε την υπηρεσία που σας ενδιαφέρει και θα επικοινωνήσουμε μαζί σας το συντομότερο." : "Choose the service you are interested in and we will contact you as soon as possible.");
define("INTEREST_FORM_IPF", ($lang == "gr") ? "Επιδότηση Επενδυτικού σχεδίου" : "Investment Plan Funding");
define("INTEREST_FORM_CS", ($lang == "gr") ? "Συμβουλευτική Υποστήριξη" : "Consulting Support");
define("INTEREST_FORM_AS", ($lang == "gr") ? "Λογιστική Υποστήριξη" : "Accounting Support");
define("INTEREST_FORM_L", ($lang == "gr") ? "Αδειοδότηση" : "Licensing");
define("INTEREST_FORM_QMS", ($lang == "gr") ? "Σύστημα Διαχείρισης Ποιότητας" : "Quality Management System");
define("INTEREST_FORM_OTHER", ($lang == "gr") ? "Άλλο" : "Other");
define("INTEREST_FORM_FN", ($lang == "gr") ? "Ονοματεπώνυμο" : "Full Name");
define("INTEREST_FORM_CN", ($lang == "gr") ? "Επωνυμία Εταιρείας*" : "Company name*");
define("INTEREST_FORM_EMAIL", ($lang == "gr") ? "Email*" : "Email*");
define("INTEREST_FORM_PHONE", ($lang == "gr") ? "Τηλέφωνο*" : "Phone*");
define("INTEREST_FORM_COMMENTS", ($lang == "gr") ? "Σχόλια" : "Comments");
define("INTEREST_FORM_SUBMIT", ($lang == "gr") ? "Υποβολή" : "Submit");
define("INTEREST_FORM", ($lang == "gr") ? "Αποδέχομαι" : "Accept");


/**
 *      News
 */
define("NEWS_NEWS", ($lang == "gr") ? "Νέα" : "News");


/**
 *      Article
 */
define("ARTICLE_BOOK_YOUR_TOUR", ($lang == "gr") ? "Κλείστε τη θέση σας!" : "Book Your Tour");


/**
 *      Checkout
 */
define("CHECKOUT_AGREE_TO_TERMS", ($lang == "gr")
    ? 'Έχω διαβάσει και συμφωνώ με τους <a href="' . BASE_URL . 'terms-conditions" style="color: blue;">Όρους Χρήσης</a>'
    : 'I have read and agree to the <a href="' . BASE_URL . 'terms-conditions" style="color: blue;">Terms & Conditions</a>');
