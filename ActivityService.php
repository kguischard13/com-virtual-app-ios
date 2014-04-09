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
	
	//$activityObjects = array(); 
	
	for ($i=0; $i<$numRows; $i++)
	{
		$obj = mysqli_fetch_object($queryGetActivities);
		
// 		$activity = new Activity($obj->Id, $obj->Name, $obj->Cost, $obj->City, $obj->State, $obj->Zip, 
// 		$obj->LocationType, $obj->PopularityIndex, $obj->Description, $obj->ActivityDate, $obj->VenueName); 
// 		
// 		$activityObject[$i] = $activity; 
		echo json_encode($obj); 
	}
		
	mysqli_close($link);
?>
