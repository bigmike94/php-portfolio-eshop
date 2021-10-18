<?php
class CartController{
    //JS code for cart is in /template/js/cart.js. Functions for cart are imported from functions.js
    private $lang;
    private $langpack;
    private $title;
    private $cart;
    function __construct($lang, $langpack){
        $this->lang = $lang;
        $this->langpack = $langpack;
        $this->title = new Title($lang);
        $this->cart = new Cart();
    }
    public function actionView(){
        $title = $this->title->getTitle();
        require_once(ROOT."/views/cart/view.php");
        return true;
    }
    public function actionGetProducts(){
        if ($_SERVER['REQUEST_METHOD']==="POST") {
            $productsAssoc = $_POST['productsAssoc'];
            $products = $this->cart->getProducts($productsAssoc);
            echo json_encode($products);
            return true;
        }
    }
    public function actionCheckout(){
        $result=false;
        $title = $this->title->getTitle();
        if (isset($_COOKIE["products"])) {
            $user = new User();
            $loggedIn = $user->checkLogged();
            if (!$loggedIn) { 
                if (isset($_POST['submit'])) {
                    $email = $_POST['email'];
                    $password = $_POST['password'];
                    $userData = $user->checkUserData($email, $password);
                    if (!$userData) $error = $this->langpack['reg_and_sign']['errors']['no_data'];
                    else {
                        $user->auth($this->lang, $userData['id'], $userData['name']);
                        header("Location: /{$this->lang}/cart"); 
                    }
                }
                $loginMsg = $this->langpack['cart']['log4chk'];
                require_once(ROOT."/views/user/login.php");
            }
            else {
                $order_date = time();
                $order = $this->cart->insertOrder($_SESSION['user']['id'], $order_date, $_COOKIE['products']);
                if ($order) {
                    $_SESSION['order_success'] = true;
                    setcookie('products', null, -1, '/');
                }
                header("Location: /{$this->lang}/cart");
            }
        }
        else header("Location: /{$this->lang}/cart"); 
        return true;
    }
}