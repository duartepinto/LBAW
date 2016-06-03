<?php 
	include_once('../../config/init.php');
	include_once($BASE_DIR .'database/users.php');


	if(!isset($_POST['id_client']) || !isset($_POST['item_instance']) || !isset($_POST['start_date']) || isset($_POST['end_date']) || $_POST['id_client'] == "" || $_POST['item_instance'] == "" || $_POST['start_date'] == "" || $_POST['end_date'] == "") {
		$_SESSION['error_messages'][] = 'Invalid Input';
		$_SESSION['form_values'] = $_POST;
		header('Location: ' . $_SERVER['HTTP_REFERER']);
		exit;
	}


	if ($username == NULL){
		echo 'User not logged';
		exit;
	}

	$idClient = $_POST['id_client'];
	$item = $_POST['item_instance'];
	$start = $_POST['start_date'];
	$end = $_POST['end_date'];


	if (bookItem($idClient, $item, $start, $end)){
		$_SESSION['success_messages'][] = 'Booking successful';
	}
	else{
		$_SESSION['error_messages'][] = 'Booking failed';  
	}


	header('Location: ' . $_SERVER['HTTP_REFERER']);