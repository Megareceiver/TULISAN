<?php

	Class operation {
		public function __construct(){
			if (session_status() == PHP_SESSION_NONE) {session_start();} // session start
			require_once('protected/config.php');
			$this->db = openGate();
		}

		public function requestData($post, $target){
			switch($target){
				case "summary" 		: $resultList = $this->summary(); break;
				
				case "product" 		: $resultList = $this->fetchAllRequest('products', array("picture", "idData", "sku", "name", "description", "qty", "price"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "productFetch" : $resultList = $this->fetchSingleRequest('products', array("picture", "pattern as `pattern[]`", "idData", "sku", "name", "description", "qty", "price"), $post['keyword']); break;
				
				case "color" 		: $resultList = $this->fetchAllRequest('colors', array("name", "idData"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "colorFetch" 	: $resultList = $this->fetchSingleRequest('colors', array("name", "idData"), $post['keyword']); break;

				case "department" 		: $resultList = $this->fetchAllRequest('departments', array("name", "idData"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "departmentFetch" 	: $resultList = $this->fetchSingleRequest('departments', array("name", "idData"), $post['keyword']); break;

				case "customer" 		: $resultList = $this->fetchAllRequest('customers', array("idData", "name", "company", "phone", "email", "CONCAT(address, '\n', city,  ,zipCode, '\n', country) as address", "COALESCE(userId,'guest')"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "customerFetch" 	: $resultList = $this->fetchSingleRequest('customers', array("idData", "name", "company", "phone", "email", "address", "city", "zipCode", "country"), $post['keyword']); break;

				case "cms_blog" 		: $resultList = $this->fetchAllRequest('cms_blog', array("idData","title", "date", "subtitle", "description", "photoBy"), $post['keyword'], "ORDER BY idData DESC", $post['page']); break;
				case "cms_blogFetch" 	: $resultList = $this->fetchSingleRequest('cms_blog', array("idData","title", "date", "subtitle", "description", "photoBy", "pictures as `pictures[]`"), $post['keyword']); break;
				
				case "cms_chatter" 		: $resultList = $this->fetchAllRequest('cms_chatter', array("name", "idData"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "cms_chatterFetch" : $resultList = $this->fetchSingleRequest('cms_chatter', array("name", "idData"), $post['keyword']); break;
				
				case "cms_home" 		: $resultList = $this->fetchAllRequest('cms_home', array("idData", "title", "description", "picture", "createdBy as publishedBy", "createdDate as publishedTime"), $post['keyword'], "ORDER BY idData ASC", $post['page']); break;
				case "cms_homeFetch" 	: $resultList = $this->fetchSingleRequest('cms_home', array("idData", "title", "description", "picture"), $post['keyword']); break;
				
				case "cms_story" 		: $resultList = $this->fetchAllRequest('cms_story', array("idData","title", "subtitle", "SUBSTRING(description, 1, 300) as description", "author"), $post['keyword'], "ORDER BY idData DESC", $post['page']); break;
				case "cms_storyFetch" 	: $resultList = $this->fetchSingleRequest('cms_story', array("idData", "title", "subtitle", "description", "author", "picture"), $post['keyword']); break;
				
				case "cms_video" 		: $resultList = $this->fetchAllRequest('cms_video', array("name", "idData"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "cms_videoFetch" 	: $resultList = $this->fetchSingleRequest('cms_video', array("name", "idData"), $post['keyword']); break;
				
				default	   : $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;
		
	        return $json;
		}

		public function removeData($post, $target){
			switch($target){
				case "product" 		: $resultList = $this->deleteById('products', $post['id']); break;
				case "color" 		: $resultList = $this->deleteById('colors', $post['id']); break;
				case "department" 	: $resultList = $this->deleteById('departments', $post['id']); break;
				case "customer" 	: $resultList = $this->deleteById('customers', $post['id']); break;
				case "vendor" 		: $resultList = $this->deleteById('vendors', $post['id']); break;
				case "order" 		: $resultList = $this->deleteById('orders', $post['id']); break;
				case "user" 		: $resultList = $this->deleteById('users', $post['id']); break;
				case "cms_blog" 		: $resultList = $this->deleteById('cms_blog', $post['id']); break;
				case "cms_chatter" 		: $resultList = $this->deleteById('cms_chatter', $post['id']); break;
				case "cms_home" 		: $resultList = $this->deleteById('cms_home', $post['id']); break;
				case "cms_story" 		: $resultList = $this->deleteById('cms_story', $post['id']); break;
				case "cms_video" 		: $resultList = $this->deleteById('cms_video', $post['id']); break;

				default	   : $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;
		
	        return $json;
		}

		public function addData($post, $target){
			switch($target){
				case "product"  : 
					$fields = array("name", "sku", "description", "material", "dimension", "qty", "price", "storyId", "colorId");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "NULL";
						array_push($values, $value);
					}

					$resultList = $this->insert('products', $fields, $values); 

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "products", "products", "picture", $resultList["feedId"]);
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["pattern"])){
							$upload = $this->uploadMultiImage($_FILES["pattern"], "patterns", "products", "pattern", $resultList['feedId']);
							$resultList["feedMultiUpload"] = $upload['feedMessage'];
						}
					}
				break;

				case "color"  : 
					$fields = array("name");
					$values = array($post["name"]);

					$resultList = $this->insert('colors', $fields, $values); 
				break;

				case "department"  : 
					$fields = array("name");
					$values = array($post["name"]);

					$resultList = $this->insert('departments', $fields, $values); 
				break;

				case "cms_home"  : 
					$fields = array("title", "description");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "NULL";
						array_push($values, $value);
					}

					$resultList = $this->insert('cms_home', $fields, $values); 

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "home", "cms_home", "picture", $resultList["feedId"]);
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "cms_story"  : 
					$fields = array("title", "subtitle", "author");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "NULL";
						array_push($values, $value);
					}

					if(isset($post['description'])) {
						array_push($fields, "description");
						array_push($values, base64_encode($post['description']));
					}

					$resultList = $this->insert('cms_story', $fields, $values); 

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "stories", "cms_story", "picture", $resultList["feedId"]);
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "cms_blog"  : 
					$fields = array("idData","title", "date", "subtitle", "photoBy");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "NULL";
						array_push($values, $value);
					}

					if(isset($post['description'])) {
						array_push($fields, "description");
						array_push($values, base64_encode($post['description']));
					}

					$resultList = $this->insert('cms_blog', $fields, $values); 

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["pictures"])){
							$upload = $this->uploadMultiImage($_FILES["pictures"], "blogs", "cms_blog", "pictures", $resultList['feedId']);
							$resultList["feedMultiUpload"] = $upload['feedMessage'];
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
					$fields = array("name", "sku", "description", "material", "dimension", "qty", "price", "storyId", "colorId");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "NULL";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					$resultList = $this->update('products', $values, $post['idData']); 

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "products", "products", "picture", $post['idData']);
							$resultList["feedUpload"] = $upload['feedMessage'];
						}

						if(isset($_FILES["pattern"])){
							$upload = $this->uploadMultiImage($_FILES["pattern"], "patterns", "products", "pattern", $post['idData']);
							$resultList["feedMultiUpload"] = $upload['feedMessage'];
						}
					
					}

				break;

				case "color"  : 
					$values = array("name = '".$post["name"]."'");
					$resultList = $this->update('colors', $values, $post['idData']); 
				break;

				case "department"  : 
					$values = array("name = '".$post["name"]."'");
					$resultList = $this->update('departments', $values, $post['idData']); 
				break;

				case "cms_home"  : 
					$fields = array("title", "description");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "NULL";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					$resultList = $this->update('cms_home', $values, $post['idData']); 

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "home", "cms_home", "picture", $post['idData']);
							$resultList["feedUpload"] = $upload['feedMessage'];
						}
					}

				break;

				case "cms_story"  : 
					$fields = array("title", "subtitle", "author");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "NULL";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['description'])) {
						$values['description'] = "description = '".base64_encode($post['description'])."'";
					}

					$resultList = $this->update('cms_story', $values, $post['idData']); 

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "stories", "cms_story", "picture", $post['idData']);
							$resultList["feedUpload"] = $upload['feedMessage'];
						}
					}

				break;

				case "cms_blog"  : 
					$fields = array("idData","title", "date", "subtitle", "photoBy");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "NULL";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['description'])) {
						$values['description'] = "description = '".base64_encode($post['description'])."'";
					}

					$resultList = $this->update('cms_blog', $values, $post['idData']); 

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["pictures"])){
							$upload = $this->uploadMultiImage($_FILES["pictures"], "blogs", "cms_blog", "pictures", $post['idData']);
							$resultList["feedMultiUpload"] = $upload['feedMessage'];
						}
					
					}

				break;

				default	   		: $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

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

				$conditions = ($conditions != "") ? "WHERE ".$conditions : "";


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

				$conditions = ($conditions != "") ? "WHERE ".$conditions : "";

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

		public function summary(){
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

				$sql = 
				" 	SELECT * FROM (
						SELECT 'Orders' as `group`, COUNT(idData) as total FROM orders
						UNION
						SELECT 'Products' as `group`, COUNT(idData) as total FROM products
						UNION
						SELECT 'Customers' as `group`, COUNT(idData) as total FROM customers
						UNION
						SELECT 'Vendors' as `group`, COUNT(idData) as total FROM vendors
						UNION
						SELECT 'Users' as `group`, COUNT(idData) as total FROM users
					) AS table_generate
				";
							
				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetchAll(PDO::FETCH_ASSOC);
				}	
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

				$sql = "INSERT INTO ".$table."(".$fields.", createdBy, createdDate) VALUES (".$values.", 'SESSION_TEST',NOW())";
							
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

				$sql = "UPDATE ".$table." SET ".$values.", changedBy = 'SESSION_TEST', changedDate = NOW() WHERE idData = '".$id."'";
							
				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
				}	

				// $feedType = $sql;
			}
			
			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);
			
			/* result fetch */
			$json = $resultList;
			
			return $json;
					
		}

		public function uploadSingleImage($image, $dir, $table, $field, $id){
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
					$newFileName 	 = $dir."_".$id.".".$fileExtension;
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

		public function uploadMultiImage($image, $dir, $table, $field, $id){
			error_reporting(E_ALL);
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to upload data!";
			$feedData	= array();

			$temp		= "";
			$counter	= 0;

			/* open connection */ 
			$gate = $this->db;
			if($gate){		

				/*upload image*/
				if(isset($image)){

					foreach($image['tmp_name'] as $key => $tmp_name ){
						$counter++;
					    $file_name = $key.$image['name'][$key];
					    $file_size = $image['size'][$key];
					    $file_tmp  = $image['tmp_name'][$key];
					    $file_type = $image['type'][$key];

						$Validextensions = array("jpeg", "JPEG", "jpg", "JPG", "png", "PNG", "gif", "GIF");
						$temporary 		 = explode(".", $file_name);
						$fileExtension   = end($temporary);
						$newFileName 	 = $dir."_".$id."(".$counter.")".".".$fileExtension;
						$saveAs 		 = "../assets/".$dir."/".$newFileName;

						if (in_array($fileExtension, $Validextensions)) {
							if(move_uploaded_file($file_tmp, $saveAs)){ 
								$temp = ($temp == "") ? $newFileName : $temp.",".$newFileName;
							}

							if($temp != ""){
								$newFileName = $temp;

								$sql = "UPDATE ".$table." SET ".$field."='".$newFileName."' WHERE idData ='".$id."'";
								$result = $this->db->query($sql);
								if($result){
									$feedStatus	= "success";
									$feedType   = "success";
									$feedMessage= "The process has been successful";
								}						
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