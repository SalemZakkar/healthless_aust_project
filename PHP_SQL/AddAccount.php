<?php
include "Connect.php";
$email = $_POST["email"];
$phone = $_POST["phone"];
$password = $_POST["password"];
$name = $_POST["name"];
$operation = $_POST["operation"];
$id = $_POST["id"];
if($operation == "add"){
    $result = mysqli_query($connect,"INSERT INTO Accounts (name,password,email,phone) VALUES ('$name','$password','$email','$phone')");
    if($result > 0){
        echo "System Added Account Successfully";
    }
    else{
        echo "System has been failed while Adding Account";
    }
}
else if($operation == "get"){

    $result = mysqli_query($connect,"SELECT * Accounts Food WHERE email = '$email'");
    if(!$result){
        die("System Cannot Find Data" . mysqli_error());
    }
    else{
    while($row = mysqli_fetch_assoc($result))
    $test[] = $row; 
    print json_encode($test);
  }

  }
  else if($operation == "edit"){
    $result = mysqli_query($connect,"UPDATE Accounts SET name='$name' ,email='$email', password='$password',phone='$phone' Where email='$id' ");
    if(!$result){
        die("System cannot edit" . mysqli_error());
    }
    else{
    print json_encode("System is Successful");
  }
  }
  else{
      $result = mysqli_query($connect,"DELETE FROM Accounts WHERE id = '$id'");
      if(!$result){
        die("System cannot Delete" . mysqli_error());
    }
    else{
    print json_encode("System is Successful");
  }
  }






?>
