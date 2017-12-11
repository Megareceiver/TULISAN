<?php

	Class order {
		public function __construct(){
			// if (session_status() == PHP_SESSION_NONE) {session_start();} // session start
			if (session_id() == '') { session_start(); }
			require_once('protected/config.php');
			$this->db = openGate();
		}

		public function requestData($post, $target){
			switch($target){
				case "orders" 			: $resultList = $this->fetchAllRequest('orders', array("idData", "name", "status", "total", "createdDate"), $post['keyword'], "ORDER BY status DESC, idData ASC, name ASC", $post['page']); break;
				case "orderItems" 	:
				case "itemsCart" 		: $resultList = $this->fetchAllRecord('orders_item i JOIN products_variant v ON i.variantId = v.idData JOIN products p ON v.productId = p.idData',array("p.name", "p.sku", "i.price", "i.qty"), $post['keyword'], "ORDER BY i.idData"); break;
				case "orderInfo" 		: $resultList = $this->fetchSingleRequest('orders o JOIN countries c ON o.country = c.country_code',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.paymentMethod"), $post['keyword']); break;
				case "recentOrders" : $resultList = $this->fetchAllRecord('orders o',array("o.idData as number", 'DATE_FORMAT(o.createdDate, "%M, %d %Y") as date', "status"), "o.createdBy = '".$_SESSION['tulisan_user_username']."' AND o.status <> 'Waiting for payment'", "ORDER BY o.idData"); break;
				case "unpaidOrders" : $resultList = $this->fetchAllRecord('orders o',array("o.idData as number", 'DATE_FORMAT(o.createdDate, "%M, %d %Y") as date', "status"), "o.createdBy = '".$_SESSION['tulisan_user_username']."' AND o.status = 'Waiting for payment'", "ORDER BY o.idData"); break;

				default	   					: $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function removeData($post, $target){
			switch($target){
				case "product" 	: $resultList = $this->deleteById('products', $post['id']); break;

				default	   : $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function addData($post, $target){
			switch($target){
				case "order"  :
					$fields = array("name", "address", "city", "zipCode", "country", "phone", "email", "total", "paymentMethod", "bank");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					array_push($fields, "customerId");
					array_push($values, ((isset($_SESSION['tulisan_customer_id']) ? $_SESSION['tulisan_customer_id'] : '0')));

					array_push($fields, "status");
					array_push($values, "Waiting for payment");

					$resultList = $this->insert('orders', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						$resultList['resultItem'] = array();
						$resultList['resultUQty'] = array();
						$resultList['resultEmail'] = array();

						$fields = array("orderId", "variantId", "price", "qty");
						$endLoop = count($post['items']);
						for($loop=0;$loop<$endLoop;$loop++){
							$item 			= $post['items'][$loop];
							$values 		= '"'.$resultList["feedId"].'", "'.$item["variantId"].'",(SELECT price FROM products_variant WHERE idData = "'.$item['variantId'].'"), "'.$item['qty'].'"';
							$resultItem = $this->insert('orders_item', $fields, $values);
							array_push($resultList['resultItem'], $resultItem);

							$resultUQty = $this->update('products_variant', "qty = (qty - ".$item['qty'].")", $item['variantId']);
							array_push($resultList['resultUQty'], $resultUQty);
						}

						//--
						$emailMessage  = "<h1><b>Thank you for your order!</b></h1>";
						$emailMessage .='<h5 class="text-warning"><b>Your Order ID is <span id="orderNumber">#'.$resultList["feedId"].'</span></b></h5>';
						$emailMessage .='<h5><i>Please put this Order ID in the message reference when making your transfer.</i></h5>';
						$emailMessage .='<h3>SHIPPING ADDRESS</h3>';
						$emailMessage .='<h5><b>'.$post['name'].'</b></h5>';
						$emailMessage .='<h5>'.$post['address'].'</h5>';
						$emailMessage .='<h5>'.$post['city']." ".$post['zipCode'].'</h5>';
						$emailMessage .='<h5>'.$post['country'].'</h5>';
						$emailMessage .='<h5>Phone : '.$post['phone'].'</h5>';
						$emailMessage .= '<table width="100%">';
						$emailMessage .= '<tr>';
						$emailMessage .= '<th>Product</th>';
						$emailMessage .= '<th>SKU</th>';
						$emailMessage .= '<th>Price</th>';
						$emailMessage .= '<th>Quantity</th>';
						$emailMessage .= '<th>Total</th>';
						$emailMessage .= '</tr>';

						//items
						for($loop=0;$loop<$endLoop;$loop++){
							$item = $post['items'][$loop];
							$fetch= $this->fetchSingleRequest('products p JOIN products_variant v ON p.idData = v.productId',array('p.name', 'p.sku', 'v.price'),'v.variantId="'.$item['variantId'].'"');
							if($fetch['feedStatus'] == "success"){
								$fetch = $fetch['feedData'];
								$emailMessage .= '<tr>';
								$emailMessage .= '<td>'.$fetch['name'].'</td>';
								$emailMessage .= '<td>'.$fetch['sku'].'</td>';
								$emailMessage .= '<td>'.$fetch['price'].'</td>';
								$emailMessage .= '<td>'.$item['qty'].'</td>';
								$emailMessage .= '<td>'.number_format(($item['qty'] * $fetch['price'])).'</td>';
								$emailMessage .= '</tr>';
							}
						}

						$emailMessage .= '<tr>';
						$emailMessage .= '<td colspan="4" align="right">Cart Total</td>';
						$emailMessage .= '<td>'.$total.'</td>';
						$emailMessage .= '</tr>';
						$emailMessage .= '<td colspan="4" align="right">Grand Total</td>';
						$emailMessage .= '<td>'.$total.'</td>';
						$emailMessage .= '</tr>';
						$emailMessage .= '</table>';

						if($post['paymentMethod'] == "BANK TRANSFER"){
							$emailMessage .= '<br/><br/>';
							$emailMessage .= '<p>Please transfer your order payment to:</p>';
							$emailMessage .= '<p>PT. Tulisan Susunan Tinta</p>';
							$emailMessage .= '<p>Bank Mandiri</p>';
							$emailMessage .= '<p>Acc. No. 126-00-0618835-2</p>';
							$emailMessage .= '<p>(Rupiah account)</p>';
							$emailMessage .= '<br/><br/>';
							$emailMessage .= '<a href="#">Confirm payment</a>';
						}elseif($post['paymentMethod'] == "DOKU WALLET"){
							$emailMessage .= '<br/><br/>';
							$emailMessage .= 'Please do your payment by doku wallet in link bellow:<br/>';
							$emailMessage .= '<a href="#">...</a>';
						}

						$emailResult = $this->emailSender($post['email'], 'Order #'.$resultList["feedId"], $emailMessage);
						array_push($resultList['resultEmail'], $emailResult);
					}
				break;

				case "processOrder"  :
				$values = array("status = 'Shipping'");
				$resultList = $this->update('orders', $values, $post['id']);

					if($resultList["feedStatus"] == "success") {
						$resultList['resultEmail'] = array();

						//--
						$emailMessage  = "<h1><b>Your order has been delivered!</b></h1>";
						$emailMessage .= '<h5 class="text-warning"><b>Your Order ID is <span id="orderNumber">#'.$post["id"].'</span></b></h5>';
						$emailMessage .= '<h5><i>Confirmation of goods received.</i></h5>';
						$emailMessage .= '<a href="#">Confirm to complete</a>';
						$emailMessage .= '<a href="#">Return of goods</a>';

						$emailResult = $this->emailSender($post['email'], 'Order #'.$post["idData"], $emailMessage);
						array_push($resultList['resultEmail'], $emailResult);
					}
				break;

				case "paymentConfirm" :
					$values = array("status = 'Ready to ship'");
					$resultList = $this->update('orders', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["transferPicture"])){
							$upload = $this->uploadSingleImage($_FILES["transferPicture"], "transferPicture", "orders", "transferPicture", $post['idData'], '1');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;
				default	   		: $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function updateData($post, $target){
			switch($target){
				case "product"  :
					$fields = array("name", "sku", "description", "material", "dimension", "price", "storyId");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					$resultList = $this->update('products', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["lookBook1"])){
							$upload = $this->uploadSingleImage($_FILES["lookBook1"], "products", "products", "lookBook1", $post['idData'], '1');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["lookBook2"])){
							$upload = $this->uploadSingleImage($_FILES["lookBook2"], "products", "products", "lookBook2", $post['idData'], '2');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}

				break;

				default	   		: $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function fetchAllRecord($table, $fields, $conditions = "", $orderBy = ""){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						$temp = $temp." ".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$conditions = ($conditions != "") ? "WHERE ".str_replace('\\', '', $conditions) : "";


				$sql = "SELECT ".$fields." FROM ".$table." ".$conditions." ".$orderBy." ";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetchAll(PDO::FETCH_ASSOC);
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function fetchAllRequest($table, $fields, $conditions = "", $orderBy = "", $paging = "1"){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						$temp = $temp." ".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$conditions = ($conditions != "") ? "WHERE ".str_replace('\\', '', $conditions) : "";


				$temp = intval($paging);
				$temp = ($temp - 1) * 20;

				$paging = "LIMIT ".$temp.",20";

				$sql = "SELECT ".$fields." FROM ".$table." ".$conditions." ".$orderBy." ".$paging;

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetchAll(PDO::FETCH_ASSOC);
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function fetchSingleRequest($table, $fields, $conditions = ""){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						$temp = $temp." ".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$conditions = ($conditions != "") ? "WHERE ".str_replace('\\', '', $conditions) : "";

				$sql = "SELECT ".$fields." FROM ".$table." ".$conditions;

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetch(PDO::FETCH_ASSOC);
				}

					$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		// DELETE DATA
		public function deleteById($table, $conditions, $image){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$sql = "DELETE FROM ".$table." WHERE idData IN (".$conditions.")";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData   = $conditions;
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		//INSERT DATA
		public function insert($table, $fields, $values){
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

				if(is_array($fields)) {
					foreach ($fields as $item) {
						if($temp  == "") $temp = $item;
						else $temp = $temp.",".$item;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($values)) {
					foreach ($values as $item) {
						if($temp  == "") $temp = "'".$item."'";
						else $temp = $temp.",'".$item."'";
					}

					$values = $temp;
					$temp   = "";
				}

				$user = (isset($_SESSION['tulisan_user_username']) ? $_SESSION['tulisan_user_username'] : 'guest');
				$sql = "INSERT INTO ".$table."(".$fields.", createdBy, createdDate) VALUES (".$values.", '".$user."',NOW())";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedId 	= $this->db->lastInsertId();
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData, "feedId" => $feedId);

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

				$sql = "UPDATE ".$table." SET ".$values.", changedBy = '".$_SESSION['tulisan_user_username']."', changedDate = NOW() WHERE idData = '".$id."'";

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

		public function emailSender($to, $subject, $message){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to send email!";
			$feedData		= array();
			$sender 		= "Customer Service";
			$emailSender= "cs@tulisan.com";

			$headers = "MIME-Version: 1.0" . "\r\n";
			$headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";

			// More headers
			$headers .= 'From: Tulisan.com <noreply@tulisan.com>'."\r\n" . 'Reply-To: '.$sender.' <'.$emailSender.'>'."\r\n";
			// $headers .= 'Cc: admin@yourdomain.com' . "\r\n"; //untuk cc lebih dari satu tinggal kasih koma

			@mail($to,$subject,$message,$headers);
			if(@mail)
			{
				$feedStatus	= "success";
				$feedType   = "success";
				$feedMessage= "The process has been successful";
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function uploadSingleImage($image, $dir, $table, $field, $id, $que = ""){
			error_reporting(E_ALL);
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to upload data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				/*upload image*/
				if(isset($image)){

					$file_name = $image['name'];
				    $file_size = $image['size'];
				    $file_tmp  = $image['tmp_name'];
				    $file_type = $image['type'];

					$Validextensions = array("jpeg", "JPEG", "jpg", "JPG", "png", "PNG", "gif", "GIF");
					$temporary 		 = explode(".", $file_name);
					$fileExtension   = end($temporary);
					$newFileName 	 = $dir."_".$id."_".$que.date("Ymdhisa").".".$fileExtension;
					$saveAs 		 = "../assets/".$dir."/".$newFileName;

					if (in_array($fileExtension, $Validextensions)) {
						if(move_uploaded_file($file_tmp, $saveAs)){
							$sql = "UPDATE ".$table." SET ".$field."='".$newFileName."' WHERE idData ='".$id."'";

							$result = $this->db->query($sql);
							if($result){
								$feedStatus	= "success";
								$feedType   = "success".is_dir($saveAs);
								$feedMessage= "The process has been successful";
							}
						}
					}
				}
				/*upload end*/

			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}
	}

?>
