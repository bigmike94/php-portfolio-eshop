<?php 
class Contact{
	public static function getContactInfo(){
		$pdo = DB::getConnection();
		$contact = $pdo->query("SELECT * FROM `contact` WHERE id=1")->fetch(PDO::FETCH_ASSOC);
		return $contact;
	}
	public static function sendMessage(){
		
	}
}
?>