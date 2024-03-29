<?
  if (!isset($_POST['username'])) die('No username given');
	
  include_once '../../config/init.php';
  include_once('../../database/users.php'); 
  

  try {
    $user = usernameExists($_POST['username']);

    if ($user === false){
      $response = array("valid" => false, "message" => "username does not exist");
      header('Content-Type: application/json');
      echo json_encode($response);
    }
    else if ($user === true){
      $response = array("valid" => true, "message" => "username exists");
      header('Content-Type: application/json');
      echo json_encode($response);
    }
  } catch (PDOException $e) {
    die($e->getMessage());
  }