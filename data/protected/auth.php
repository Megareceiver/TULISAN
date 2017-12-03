<?php

	Class auth {
		public function __construct(){
			// if (session_status() == PHP_SESSION_NONE) {session_start();} // session start
			if (session_id() == '') { session_start(); }
			require_once('protected/config.php');
			$this->db = openGate();
		}

		public function login($post){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Username or password not match!";
			$feedData	= array();

			$temp		= "";
			$username = $post['username'];
			$password = $post['password'];

			/* open connection */
			$gate = $this->db;
			if($gate){

				$sql = "SELECT c.idData, u.username, u.name, u.type, d.name as departement, u.picture, c.address, c.city, c.country as country_code, y.country_name as country, c.zipCode, c.phone, c.email FROM users u LEFT JOIN customers c ON u.idData = c.userId LEFT JOIN departments d ON u.departmentId = d.idData LEFT JOIN countries y ON c.country = y.country_code WHERE u.username = '".$username."' AND u.password = md5('".$password."')";

				$result = $this->db->query($sql);
				if($result){
					$feedData   = $result->fetchAll(PDO::FETCH_ASSOC);
					if(isset($feedData[0]) && $feedData[0]['username'] != "" && $feedData[0]['username'] != null){
						$feedData		= $feedData[0];
						$feedStatus	= "success";
						$feedType   = "success";
						$feedMessage= "The process has been successful";

						$_SESSION['tulisan_customer_id'] 			= $feedData['idData'];
						$_SESSION['tulisan_user_name'] 				= $feedData['name'];
						$_SESSION['tulisan_user_username'] 		= $feedData['username'];
						$_SESSION['tulisan_user_type'] 				= $feedData['type'];
						$_SESSION['tulisan_user_picture'] 		= $feedData['picture'];
						$_SESSION['tulisan_user_departement'] = $feedData['departement'];

						$_SESSION['tulisan_user_address'] 		 = $feedData['address'];
						$_SESSION['tulisan_user_city'] 				 = $feedData['city'];
						$_SESSION['tulisan_user_country'] 		 = $feedData['country'];
						$_SESSION['tulisan_user_country_code'] = $feedData['country_code'];
						$_SESSION['tulisan_user_zipCode'] 		 = $feedData['zipCode'];
						$_SESSION['tulisan_user_phone'] 			 = $feedData['phone'];
						$_SESSION['tulisan_user_email']				 = $feedData['email'];
					}
				}
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function logout(){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "success";
			$feedType   = "success";
			$feedMessage= "Success to logout!";
			$feedData	= array();

			$temp		= "";

			// remove all session variables
			session_unset();

			// destroy the session
			session_destroy();

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function updateData($post, $target){
			switch($target){
				case "color"  :
					$values = array("confirmation = 'yes'");
					$resultList = $this->update('users', $values, $post['username']);
				break;

				default	   		: $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		//UPDATE DATA
		public function update($table, $values, $id){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();
			$feedId		= "";

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($values)) {
					foreach ($values as $item) {
						if($temp  == "") $temp = $item;
						else $temp = $temp.",".$item;
					}

					$values = $temp;
					$temp   = "";
				}

				$sql = "UPDATE ".$table." SET ".$values.", changedBy = 'SESSION_TEST', changedDate = NOW() WHERE idData = '".$id."'";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}
	}

?>
