<?php 
	include_once('../../config/init.php');
	include_once($BASE_DIR .'database/users.php');

	if(!$_POST['username'] || !$_POST['password']) {
		$_SESSION['error_messages'][] = 'Invalid login';
		$_SESSION['form_values'] = $_POST;
		header('Location: ' . $_SERVER['HTTP_REFERER']);
		exit;
	}

	$username = $_POST['username'];
	$password = $_POST['password'];

	if (isLoginCorrect($username, $password)) {
		if(isUserBanned($username)){
			header('HTTP/1.0 403 Forbidden');
			die();
		}
		$_SESSION['username'] = $username;
		$_SESSION['user_type'] = getUserType($username);
		var_dump(getUserType($username));
		$_SESSION['success_messages'][] = 'Login successful';  
	} else {
		$_SESSION['error_messages'][] = 'Login failed';  
		header('Location: ' . $_SERVER['HTTP_REFERER']);
		exit();
	}
	header('Location: ' . $BASE_URL);