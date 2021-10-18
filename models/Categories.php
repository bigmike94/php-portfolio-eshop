<?php 
class Category{
	public static function getCtgList(){
		$pdo = DB::getConnection();
		$ctg = $pdo->query("SELECT * FROM `categories` ORDER BY sort_order ASC")->fetchAll(PDO::FETCH_ASSOC);
		return $ctg;
	}
}
?>