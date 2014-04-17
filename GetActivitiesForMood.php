<?php

include("const_db.inc"); 
include("ChromePhp.php"); 
include("Activity.php"); 

?>

<?php
	
	$mood = $_GET['Mood']; 
	
	if(!is_numeric($mood))
		echo "Stop Trying to Hack Us";
		
				
	$link = mysqli_connect($host, $username, $password, $dbname, $port);

	if (mysqli_connect_errno()) 
	{
		printf("Connect failed: %s\n", mysqli_connect_errno());
		exit();
	}

	$queryActivitiesForMood = mysqli_query($link, 
		"SELECT 
			act.Id, 
			act.Name, 
			act.Cost, 
			act.City, 
			act.State, 
			act.Zip, 
			act.LocationType, 
			act.PopularityIndex, 
			act.Description, 
			act.VenueName,
			act.ImagePath
		FROM Activity_has_Mood has, Activity act, Mood mood
		WHERE has.Activity_Id = act.Id and has.Mood_Id =".$mood."
		GROUP BY has.Activity_Id"); 
		
	if($queryActivitiesForMood)
	{
		$numRows = mysqli_num_rows($queryActivitiesForMood); 
	
		$activityObjects = array(); 
	
		for ($i=0; $i<$numRows; $i++)
		{
			$obj = mysqli_fetch_object($queryActivitiesForMood);
			$activityObjects[$i] = $obj; 
		}
	
		echo json_encode($activityObjects); 
	}
			

	mysqli_close($link);
?>
