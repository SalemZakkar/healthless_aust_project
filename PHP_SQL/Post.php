<?php
include "Connect.php";
$post = $_POST["post"];
$image = $_POST["image"];
$who = $_POST["who"];
$id = $_POST["id"];
$operation = "add";
if($operation == "add"){
    $result = mysqli_query($connect,"INSERT INTO posts (post,image,who) VALUES ('$post','$image','$who')");
    if($result > 0){
        echo "System Added Account Successfully";
    }
    else{
        echo "System has been failed while Adding Account";
    }
}
else if($operation == "get"){

    $result = mysqli_query($connect,"SELECT * From posts  WHERE id = '$who'");
    if(!$result){
        print "System Fail";
    }
    else{
    while($row = mysqli_fetch_assoc($result))
    $test[] = $row; 
    print json_encode($test);
  }

  }
  else if($operation == "getall"){
    $result = mysqli_query($connect,"SELECT * From posts");
    if(!$result){
        print "System Fail";
    }
    else{
    while($row = mysqli_fetch_assoc($result))
    $test[] = $row; 
    print json_encode($test);
  }
  }
  
  else if($operation=="del"){
      $result = mysqli_query($connect,"DELETE FROM Accounts WHERE id = '$id'");
      if(!$result){
        die("System cannot Delete" . mysqli_error());
    }
    else{
    print json_encode("System is Successful");
  }
  }
?>
