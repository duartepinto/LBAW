<?php
	include_once('../../config/init.php');
	include_once($BASE_DIR .'database/users.php');

	echo "cheguei";

	if(!isset($_GET['username'])){
		$response = "not logged";
	}
	else{
		$username = $_GET['username'];

		try {
			$response = getUserBookings($username);
		} catch(PDOException $e){
			die($e->getMessage());
		}
	}
	echo "cheguei2";

	
	header('Content-Type: application/json');
	echo json_encode($response);
