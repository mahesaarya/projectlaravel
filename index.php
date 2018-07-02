<?php

	include("connect.php"); 	
	
	$link=Connection();

	$result=mysql_query("SELECT * FROM `test_rfid` ORDER BY `id` DESC",$link);
?>

<html>
   <head>
      <title>RFID Data</title>
   </head>
<body>
   <h1>RFID readings</h1>

   <table border="1" cellspacing="1" cellpadding="1">
		<tr>
			<td>&nbsp;Date&nbsp;</td>
        	<td>&nbsp;Time&nbsp;</td>
			<td>&nbsp;Ruang&nbsp;</td>
			<td>&nbsp;RFID&nbsp;</td>
		</tr>

      <?php 
		  if($result!==FALSE){
		     while($row = mysql_fetch_array($result)) {
		        printf("<tr><td> &nbsp;%s </td><td> &nbsp;%s </td><td> &nbsp;%s&nbsp; </td><td> &nbsp;%s&nbsp; </td></tr>", 
		           $row["date"], $row["time"],$row["room"], $row["card"]);
		     }
		     mysql_free_result($result);
		     mysql_close();
		  }
      ?>

   </table>
</body>
</html>
