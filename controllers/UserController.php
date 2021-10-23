<?php
class UserController{
    private $lang;
    private $langpack;
    private $title;
    function __construct($lang, $langpack){
        $this->lang = $lang;
        $this->langpack = $langpack;
        $this->user = new User();
        $this->title = new Title($lang);
    }
    public function actionRegister(){
        $title = $this->title->getTitle();
        $result = false;
        $errors = array();    
        if (isset($_POST['submit'])) {
            $name = $_POST['name'];
            $email = $_POST['email'];
            $phone = $_POST['phone'];
            $address = $_POST['address'];
            $password = $_POST['password'];
            if (!$this->user->checkName($name)) 
                {$errors[] = $this->langpack['reg_and_sign']['errors']['name'];}
            if (!$this->user->checkEmail($email)) 
                {$errors[] = $this->langpack['reg_and_sign']['errors']['email'];}
            if (!$this->user->checkPhone($phone)) 
                {$errors[] = $this->langpack['reg_and_sign']['errors']['phone'];}
            if (!$this->user->checkAddress($address)) 
                {$errors[] = $this->langpack['reg_and_sign']['errors']['address'];}
            if (!$this->user->checkPassword($password)) 
                {$errors[] = $this->langpack['reg_and_sign']['errors']['password'];}
            if ($this->user->checkDataExist($email, $phone))
                {$errors[] = $this->langpack['reg_and_sign']['errors']['data_exist'];}
            if (empty($errors)){
                $result = $this->user->register($name, $email, $phone, $address, md5($password));
                if (!empty($result)) {
                   echo "<meta http-equiv='refresh' content='1; URL=/{$this->lang}/user/login'>";
                }
                else $error = "DB error";
            }
        }
        $loggedIn = $this->user->checkLogged();
        if(!$loggedIn) require_once(ROOT.'/views/user/register.php');
        else header("Location: {$this->lang}"); 
        return true;
    }
    public function actionLogin(){ 
        $result = false;
        $title = $this->title->getTitle();
        if (isset($_POST['submit'])) {
            $email = $_POST['email'];
            $password = $_POST['password'];
            $userData = $this->user->checkUserData($email, $password);
            if (!$userData) $error = $this->langpack['reg_and_sign']['errors']['no_data'];
            else $this->user->auth($this->lang, $userData['id'], $userData['name']);
        }
        $loggedIn = $this->user->checkLogged();
        if(!$loggedIn) require_once(ROOT.'/views/user/login.php');
        else header("Location: /{$this->lang}");
        return true; 
    }
     public function actionOrders(){ 
        $title = $this->title->getTitle();
        $loggedIn = $this->user->checkLogged();
        if($loggedIn) require_once(ROOT.'/views/user/orders.php');
        else header("Location: /{$this->lang}");
        return true; 
    }
    public function actionProfile(){
        session_start();
        $updatesArray = array();
        $result=false;
        $title = $this->title->getTitle();
        $current_data = $this->user->getUserById($_SESSION["user"]["id"]);
        $msg_from=false;
        if (isset($_POST["submit"])) {
            $errors = array();
            if (isset($_POST["email"])&&isset($_POST["phone"])&&isset($_POST['address'])) {
                $email = $_POST["email"];
                $phone = $_POST["phone"];
                $address = $_POST["address"];
                $msg_from = "data_upd";
                if (!empty($email)) {
                    if ($this->user->checkEmail($_POST['email'])) 
                        {$updatesArray["email"] = $email;}
                    else $errors[] = $this->langpack['reg_and_sign']['errors']['email'];
                }
                if (!empty($phone)) {
                    if ($this->user->checkPhone($_POST['phone'])) 
                        {$updatesArray["phone"] = $phone;}
                    else $errors[] = $this->langpack['reg_and_sign']['errors']['phone'];
                }
                if (!empty($address)) {
                    if ($this->user->checkAddress($_POST['address'])) 
                        {$updatesArray["address"] = $address;}
                    else $errors[] = $this->langpack['reg_and_sign']['errors']['address'];
                }
            }
            else if (
                isset($_POST["old_password"])&&
                isset($_POST["new_password"])&&
                isset($_POST['password_confirm'])) {
                    $old_password = $_POST["old_password"];
                    $new_password = $_POST["new_password"];
                    $password_confirm = $_POST["password_confirm"];
                    $msg_from = "psw_upd";
                    if (empty($current_data)) {
                        $errors = $this->langpack['reg_and_sign']['errors']['old_password'];
                    }
                    else {
                        if (!$this->user->checkPassword($new_password)) {
                            $errors[] = $this->langpack['reg_and_sign']['errors']['password'];;
                        }
                        if ($old_password===$new_password) {
                            $errors[] = $this->langpack['reg_and_sign']['errors']['new_and_old'];
                        }
                        if ($new_password!==$password_confirm) {
                            $errors[] = $this->langpack['reg_and_sign']['errors']['no_match'];
                        }
                        
                    }
                if (empty($errors)) $updatesArray["password"] = $new_password;
            }
            if (empty($errors)) {
                if (empty($updatesArray)) $errors = $this->langpack['reg_and_sign']['errors']['empty_inp'];
                else $result = $this->user->edit($_SESSION["user"]["id"], $updatesArray);
            }

        }
        require_once(ROOT.'/views/user/profile.php');
        return true;
    }
    public function actionLogout(){
        session_start();
        unset($_SESSION["user"]);
        header("Location: /{$this->lang}");
    }
}