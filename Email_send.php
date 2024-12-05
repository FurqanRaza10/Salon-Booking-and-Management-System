<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once __DIR__ . '/application/libraries/PHPMailer/src/PHPMailer.php';
require_once __DIR__ . '/application/libraries/PHPMailer/src/Exception.php';
require_once __DIR__ . '/application/libraries/PHPMailer/src/SMTP.php';

// Include PHPMailer autoloader
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Load Composer's autoloader (if you use Composer)
// require 'vendor/autoload.php'; 

// Create a new PHPMailer instance
$mail = new PHPMailer(true); // Passing `true` enables exceptions
$otp = 1000;
$name = 'Haidarali';
$date = date("d M, Y");
try {
    //qmal nnau tnda fzvr
    //Server settings
    $mail->isSMTP(); // Set mailer to use SMTP
    $mail->Host = 'smtp.gmail.com'; // Set the SMTP server to send through
    $mail->SMTPAuth = true; // Enable SMTP authentication
    $mail->Username = 'salonhub2024@gmail.com'; // Your Gmail email address
    $mail->Password = 'qmalnnautndafzvr'; // Your Gmail password (use App Password for 2-step verification)
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Enable TLS encryption
    $mail->Port = 587; // TCP port to connect to

    //Recipients
    $mail->setFrom('salonhub2024@gmail.com', 'Saloon Hub'); // Set sender's email and name
    $mail->addAddress('hs.tech025@gmail.com', 'hs chaudhary'); // Add a recipient

    ob_start(); // Start output buffering
    include_once __DIR__ . '/view/otp_email_temp.php'; // Include the OTP HTML template
    $emailContent = ob_get_clean(); // Get the output of the template

    // Replace placeholders with actual values
    $emailContent = str_replace('{{otp}}', $otp, $emailContent);
    $emailContent = str_replace('{{name}}', $name, $emailContent);
    $emailContent = str_replace('{{date}}', $date, $emailContent);



    //Content
    $mail->isHTML(true); // Set email format to HTML
    $mail->Subject = 'OTP for Email Varification';
    $mail->Body    = $emailContent;
    // Send the email
    if ($mail->send()) {
        echo 'Message has been sent';
    }
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}
?>

?>