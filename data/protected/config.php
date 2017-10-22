<?php 		
	define('db_host', "localhost");
	define('db_user', "root");
	define('db_pass', "");
	define('db_name', "tulisan_db");
	
	function openGate(){
		$gate = new PDO("mysql:host=".db_host.";dbname=".db_name, db_user, db_pass); 
		$gate->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $gate;
	} 
	
	function closeGate($gate){
		mysqli_close($gate);
	}

	function basePath(){
		return $_SERVER['SERVER_NAME'].'/TULISAN/';
	}
?>