<?php
   	include("connect.php");
   	
   	$link=Connection();

	$date=date("Y-m-d");
	$time=date("H:i:s");
	$room=$_POST["room"];
	$card=$_POST["card"];

	$query = "INSERT INTO `test_rfid` (`date`,`time`,`room`, `card`) 
		VALUES ('".$date."','".$time."','".$room."','".$card."')"; 
   	
   	mysql_query($query,$link);
	mysql_close($link);

   	header("Location: index.php");
?>
