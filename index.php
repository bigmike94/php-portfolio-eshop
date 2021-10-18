<?php

//front controller
//1. Общие настройки
ini_set('display_error', 1);
error_reporting(E_ALL);

//2. Подключение файлов системы

define('ROOT', dirname(__FILE__));
define('LANGS', array("ge", "en"));
define("DEFAULT_LANG", "ge");
require_once(ROOT.'/components/Autoload.php');

$router = new Router();
$router->run();
?>