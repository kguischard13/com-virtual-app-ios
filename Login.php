<?php
include("const_db.inc");

session_start(); 

if(isset($_POST['UserName']) && isset($_POST['Password']))
{
	$user = $_POST['UserName']; 
	$pass = $_POST['Password']; 
				
	$link = mysqli_connect($host, $username, $password, $dbname, $port);

	if (mysqli_connect_errno()) 
	{
		printf("Connect failed: %s\n", mysqli_connect_errno());
		exit();
	}
	
	$queryForUser = mysqli_query($link, "SELECT * FROM User WHERE UserName = '".$user."' and Password ='".$pass."'");   
	
	if($queryForUser)
	{
		$numRows = mysqli_num_rows($queryForUser); 				
		
		if($numRows == 1)
		{
			$obj = mysqli_fetch_object($queryForUser);
			$_SESSION['UserId'] = $obj->Id; 
			echo "EmotionSelection.php"; 
		}
		else
		{
			echo "HomeView.php"; 
		}
	}
	
	mysqli_close($link);
}

?>