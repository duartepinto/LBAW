<?php
  
  function createUser($email, $username, $password,$type) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO users(email,username,password,type) VALUES (?, ?, ?,?)");
    $result = $stmt->execute(array($email, $username, crypt($password),$type));
    return $result;
  }

  function createClient($email, $username, $password,$id_card,$address,$phone){

    global $conn;
    try{
      $conn->beginTransaction();
      $stmt1 = $conn->prepare(
        'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;');
      
      if(!$stmt1)
        throw new PDOException("Error Processing Request", 1);
        
      $stmt1->execute();
      
      $stmt2 = $conn->prepare("INSERT INTO users(email,username,password,type) VALUES (?, ?, ?, 'Client') RETURNING id");

      if(!$stmt2)
        throw new PDOException("Error Processing Request", 1);

      $result2 = $stmt2->execute(array($email, $username, crypt($password)));
      
      if(!$result2)
        throw new PDOException("Error Processing Request", 1);

      $result2 = $stmt2->fetch();
      $id = $result2['id'];

      $stmt3 = $conn->prepare("INSERT INTO clients(id,id_card,address,phone_number) VALUES (?, ?, ?, ?)");

      if (!$stmt3)
        throw new PDOException("Error Processing Request", 1);

      $result3 = $stmt3->execute(array($id, $id_card,$address,strval($phone)));
      if(!$result3)
        throw new PDOException("Error Processing Request", 1);

      $conn->commit();

      return true; 
    }catch(PDOException $e) {
      $conn->rollback();
      echo $e->getMessage();
      return false;
    }
       
  }

  function isLoginCorrect($username, $password) {
    global $conn;
    $stmt = $conn->prepare("SELECT password
                            FROM users 
                            WHERE username = ?");
    $stmt->execute(array($username));
    $pass = $stmt->fetch()['password'];

    if ($pass == NULL){
      return false;
    }
    
    return crypt($password, $pass);

  }

  function usernameExists($username){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = :user");
    $stmt->bindParam(":user", $username, PDO::PARAM_STR);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($result) === 0) {
      return false;
    }
    return true;
  }

  function isInventoryManager($username){
    global $conn;
    $user = getUserByUsername($username);
    if($user === false)
      return false;
    if($user['type'] == 'InventoryManager'){
      return true;
    }else{
      return false;
    }
  }

  function getUserByUsername($username){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM users where username = :username");
    $stmt->bindParam(":username", $username,PDO::PARAM_STR);
    $stmt->execute();
    $result = $stmt->fetchAll();
    if(count($result) ===0){
      return false;
    }
    return $result[0];   
  }

  function getClientByUsername($username){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM users where username = :username");
    $stmt->bindParam(":username", $username,PDO::PARAM_STR);
    $stmt->execute();
    $result = $stmt->fetchAll();
    if(count($result) ===0){
      return 'user does not exist';
    }
    $id = $result[0]['id'];
    
    $stmt2 = $conn->prepare("SELECT * FROM clients where id = :id");
    $stmt2->bindParam(":id", $id,PDO::PARAM_INT);
    $stmt2->execute();
    $client = $stmt2->fetchAll();
    if(count($client) === 0){
      return 'client does not exist';
    }
    return $client[0];
  }

  function changeEmail($username, $newEmail){
    global $conn;
    $stmt = $conn->prepare("UPDATE users SET email = :email where username = :username");
    $stmt->bindParam(":username", $username,PDO::PARAM_STR);
    $stmt->bindParam(":email", $newEmail,PDO::PARAM_STR);
    $stmt->execute();
    $result = $stmt->fetchAll();
    if(count($result) ===0){
      return false;
    }
    return $result[0];
  }

  function changePassword($newPassword){
    global $conn;
    $stmt = $conn->prepare("UPDATE users SET password = :password where username = :username");
    $stmt->bindParam(":username", $username,PDO::PARAM_STR);
    $stmt->bindParam(":password", $newPassword,PDO::PARAM_STR);
    $stmt->execute();
    $result = $stmt->fetchAll();
    if(count($result) ===0){
      return false;
    }
    return $result[0];
  }

  function getUserBookings($username){
    global $conn;
    $stmt = $conn->prepare("SELECT items.name AS name, categories.name AS category, subcategories.name AS subcategory,reservations.start_time AS start_date, reservations.end_time AS end_date
        FROM categories, subcategories, items, item_instances, reservations, users
        WHERE users.username = :user AND users.id = reservations.id_client AND 
              reservations.id_item_instance = item_instances.id AND item_instances.id_item = items.id AND
              items.id_subcategory = subcategories.id AND subcategories.id_category = categories.id");
    $stmt->bindParam(":username", $username,PDO::PARAM_STR);
    $result = $stmt->fetchAll();
    if(count($result) ===0){
      return false;
    }
    return $result;  
  }
  function getUserType($username){
    global $conn;
    $stmt = $conn->prepare("SELECT type FROM users where username = :username");
    $stmt->bindParam(":username", $username,PDO::PARAM_STR);
    $stmt->execute();
    $result = $stmt->fetchAll();
    if(count($result) ===0){
      throw new Exception('user does not exist', 1);
    }
    $id = $result[0];
  }

?>
