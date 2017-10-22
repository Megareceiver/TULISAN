<?php
	
	//declare 
	$error = 0; //error init state
	$json  = array( "feedStatus" => "forbidden", "feedType" => "danger", "feedMessage" => "Akses ditolak!", "feedData" => array());
	$route = null;

	if(isset($_GET['session']) && $_GET['session'] != ""){
		switch($_GET['group']){
			case "operation"	: require_once('protected/operation.php'); $route = new operation(); break;
			default  			: $error = 1; break;
		}
		
		if($error != 1){
			switch($_GET['session']){
				/* auth session */
				case 'login':  
					$json = login($_POST);
				break;
				
				case 'logout':  
					$json = logout();
				break;
				/* end auth session */

				
				case 'addData':
					$json = $route->addData($_POST, $_GET['target']);
				break;
				
				case 'updateData':
					$json = $route->updateData($_POST, $_GET['target']);
				break;
				
				case 'removeData':
					$json = $route->removeData($_POST, $_GET['target']);
				break;
				
				case 'requestData':
					$json = $route->requestData($_POST, $_GET['target']);
				break;
				
				default:
					$json = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Terjadi kesalahan fatal, proses dibatalkan!", "feedData" => array());
				break;

			}
		}
	}
	

	/* Send as JSON */
	 header("Content-Type: application/json", true);

	/* Return JSON */
	echo json_encode($json);
?>