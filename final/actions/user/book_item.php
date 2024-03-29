<?php 
	include_once('../../config/init.php');
	include_once($BASE_DIR .'database/users.php');
	include_once($BASE_DIR .'database/util.php');


	if(!isset($_POST['item_instance']) || !isset($_POST['start_date']) || !isset($_POST['end_date']) || $_POST['end_date'] == "" || $_POST['start_date'] == "" || $_POST['item_instance'] == "") {
		$_SESSION['error_messages'][] = 'Invalid Input';
		$_SESSION['form_values'] = $_POST;
		
		header('Location: ' . $_SERVER['HTTP_REFERER']);
		exit;
	}


	if ($username == NULL){
		echo 'User not logged';
		header('Location: ' . $_SERVER['HTTP_REFERER']);
		exit;
	}

	$idClient = getUserByUsername($username)['id'];

	$item = test_input($_POST['item_instance']);
	$start = $_POST['start_date'];
	$end = $_POST['end_date'];

	$start = validateDatePicker($start);
	$end = validateDatePicker($end);


	$bookings = getBookingsFromInstance($item);

	$alterar = TRUE;

	for($i = 0; $i < count($bookings); $i++){
		$st = $bookings[$i]['start_time'];
		$et = $bookings[$i]['end_time'];
		if (($st >= $start && $st <= $end)|| ($et >= $start && $et <= $end) || ($start >= $st && $start <= $et) || ($end >= $st && $end <= $et))
			$alterar = FALSE;
	}

	if ($alterar){
		if (bookItem($idClient, $item, $start, $end)){
			$_SESSION['success_messages'][] = 'Booking successful';
		}
		else{
			$_SESSION['error_messages'][] = 'Booking failed';  
		}
	}	
	else{
		$_SESSION['error_messages'][] = 'Booking failed'; 
	}


	header('Location: ' . $_SERVER['HTTP_REFERER']);