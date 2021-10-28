<?php
//PHPMailer namespaces
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
//composer autoloader
require ROOT."/vendor/autoload.php";
class UsePhpMailer{
    public function __construct($langpack){
        $mailSettings = include(ROOT."/config/mail_settings.php");
        $this->langpack = $langpack;
        $this->mailer = new PHPMailer(true);
        $this->mailer->isSMTP();
        $this->mailer->Host = $mailSettings["Host"];
        $this->mailer->SMTPAuth = $mailSettings["SMTPAuth"];
        $this->mailer->Username = $mailSettings["Username"];
        $this->mailer->CharSet = "UTF-8"; 
        $this->to = $mailSettings["AdminMail"];                  
        $this->mailer->Password = $mailSettings["Password"]; 
        $this->mailer->SMTPSecure =  $mailSettings["SMTPSecure"];
        $this->mailer->Port = $mailSettings["Port"];    
    }
    public function sendContactForm($name, $email, $subject, $msg){
        try {
            $this->mailer->isHTML(true);
            $this->mailer->setFrom($this->mailer->Username, "EshopperAdmin");
            $this->mailer->addAddress($this->to);
            $this->mailer->Subject = $subject; 
            $this->mailer->Body = 
            "<p><b>{$this->langpack['contact']['placeholders']['name']}:</b>&nbsp;{$name}</p>
            <p><b>{$this->langpack['contact']['mail']}:</b>&nbsp;{$email}</p>
            <p><b>{$this->langpack['contact']['placeholders']['subject']}:</b>&nbsp;{$subject}</p><hr>
            <pre>{$msg}</pre>";
            return $this->mailer->send();
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$this->mailer->ErrorInfo}";
            die();
        }
    }
}