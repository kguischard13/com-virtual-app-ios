<?php

include("const_enums.inc"); 
include("ChromePHP.php"); 

?>

<?php

	mysql_connect($server, $username, $password);
	@mysql_select_db($dbname) or die("Unable to select database");

	$queryGetActivities = mysql_query("SELECT * FROM Activity"); 
	$numRows = mysql_num_rows($queryGetActivities); 
	
// 	$qAct = mysql_query("SELECT * FROM tut_Action WHERE PageID=".$currPage." AND ActionNum=".$currAction);
// 	$actioID = mysql_result($qAct, 0, "ActionID");
// 
// 	$qCondit = mysql_query("SELECT * FROM tut_Condition WHERE ActionID=".$actioID);
// 	$conditionsCount = mysql_num_rows($qCondit);
// 	$conditionsNames = array();
// 	$conditionsValues = array();

	$activityObjects = array(); 
	
	
	for ($i=0; $i<$numRows; $i++)
	{
		$activityObjects[$i] = mysql_fetch_object($queryGetActivities, "Activity"); 
		
// 		$activityObjects[$i] = mysql_result($queryGetActivities, $i, "RefName");
// 		$conditionsValues[$i] = mysql_result($queryGetActivities, $i, "RefValue");
	}
	
	echo $activityObjects; 

?>
