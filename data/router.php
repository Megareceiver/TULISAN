<?php

	//declare
	$error = 0; //error init state
	$json  = array( "feedStatus" => "forbidden", "feedType" => "danger", "feedMessage" => "Akses ditolak!", "feedData" => array());
	$route = null;

	if(isset($_GET['session']) && $_GET['session'] != ""){
		switch($_GET['group']){
			case "auth"				: require_once('protected/auth.php'); $route = new auth(); break;
			case "operation"	: require_once('protected/operation.php'); $route = new operation(); break;
			case "order"			: require_once('protected/order.php'); $route = new order(); break;
			case "support"		: require_once('protected/support.php'); $route = new support(); break;
			default  					: $error = 1; break;
		}

		if($error != 1){
			switch($_GET['session']){
				/* auth session */
				case 'login':
					$json = $route->login($_POST);
				break;

				case 'logout':
					$json = $route->logout();
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
