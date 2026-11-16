<?php
include __DIR__ . "/configTesting.php";



try {    //we love try catch blocks
  $dsn = "mysql:host=courses;dbname=z2051299";
  $pdo = new PDO($dsn, $username, $password);
}

catch(PDOexception $e) { // deal with it
	echo "Connection to database failed: " . $e->getMessage();
}
?>









<!DOCTYPE html> 
<html>
<head>

<title>KARAOKE</title> 

</head>



<body>


<p1>For testing php code and linking databases</p1> 




</body>




</html>
