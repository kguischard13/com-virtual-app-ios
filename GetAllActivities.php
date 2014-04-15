<?php

include("const_db.inc"); 
include("ChromePhp.php"); 
include("Activity.php"); 

?>

<?php
	$link = mysqli_connect($host, $username, $password, $dbname, $port);

	if (mysqli_connect_errno()) 
	{
		printf("Connect failed: %s\n", mysqli_connect_errno());
		exit();
	}

	$queryGetActivities = mysqli_query($link, "SELECT * FROM Activity"); 
	$numRows = mysqli_num_rows($queryGetActivities); 
	
	$activityObjects = array(); 
	
	for ($i=0; $i<$numRows; $i++)
	{
		$obj = mysqli_fetch_object($queryGetActivities);
 		$activityObjects[$i] = $obj; 
	}
	
	echo json_encode($activityObjects); 
	mysqli_close($link);
?>
