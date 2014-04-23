<?php


include("const_db.inc"); 
include("ChromePhp.php"); 

session_start(); 
if(!isset($_SESSION['UserId']))
{
	header("Location: Logout.php"); 
}

?>


<!DOCTYPE html>
<html>
    <head>
        <title>Doo-Dah - Mood Selection</title>
        <script src="./js/jquery-1.11.0.js"></script>
        <script src="./js/jquery-ui-1.10.4/ui/jquery-ui.js"></script>
        <script type="text/javascript" src="./js/ViewScripts/General.js"></script>
        <link rel="stylesheet" type="text/css" href="./css/General.css"/>
        <link rel="stylesheet" type="text/css" href="./css/UserPreferencesView.css"/>
        <link rel="stylesheet" type="text/css" href="./css/MoodProfileView.css"/>
    </head>

    <body>
        <div id="container">
            <div id="top-navigation">
                <div id="navigation">
                    <div id="nav-list">
                        <ul>
                            <!--<li class="top-level"><a href="./HomeView.php" id="home">Home</a></li>-->
                            <li class="top-level"><a href="#" id="how" title="Take the tutorial if you are a newcomer or view help documentation.">How it works?</a></li>
                            <li class="top-level"><a href="./EmotionSelection.php" id="emotions" title="Pick your current emotion to view new activities.">Emotions</a></li>
                            <li class="top-level"><a href="./ActivityView.php" id="activities" title="View your recent, favorite, or trending activities.">Activities</a></li>
                            <li class="top-level"><a href="#" id="account">My Account</a>
                                <ul id="sub-menu">
                                    <li class="sub-level"><a href="./Logout.php" id="login" title="Log in if you already have an account.">Logout</a></li>
                                    <!--<li class="sub-level"><a href="./RegistrationView.php" id="new-user" title="New users, register here">Sign up</a></li>-->
                                    <!--<li class="sub-level"><a href="#" id="forgot-password" title="Forgot your password?">Forgot password</a></li>-->

                                </ul>
                            </li>       
                        </ul
                    </div>
                </div>
            </div>
        </div>

        <div class="page-content">
        	<h1 id="header-text">Preferences</h1>
			<form name="UserPrefs" method="POST">
			<table id="prefs-frame">
			<tr>
			<td>
				<table id="prefs1">
					<tr>
						<th colspan="2">What sort of activities do you <u>dislike</u>? (check all that apply)</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="shopping" value="shopping">Shopping</input></td>
						<td><input type="checkbox" name="movies" value="movies">Going to the movies</input></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="restaurants" value="restaurants">Eating out at restaurants</input></td>
						<td><input type="checkbox" name="reading" value="reading">Leisure reading</input></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="concerts" value="concerts">Concerts/music events</input></td>
						<td><input type="checkbox" name="gaming" value="gaming">Playing video games</input></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="drink" value="drink">Grabbing a drink</input></td>
						<td><input type="checkbox" name="outdoors" value="outdoors">Outdoorsy stuff</input></td>
					</tr>
				</table>				
			</td>
			
			<td rowspan="2">
				<table id="prefs2">
					<tr>
						<th colspan="3">Like any of these sports?</th>
					</tr>
					<tr>
						<td>Baseball:</td>
						<td><input type="radio" name="baseball" value="Yes">Yes</input></td>
						<td><input type="radio" name="baseball" value="No">No</input></td>				
					</tr>
					<tr>
						<td>Football:</td>
						<td><input type="radio" name="football" value="Yes">Yes</input></td>
						<td><input type="radio" name="football" value="No">No</input></td>				
					</tr>
					<tr>
						<td>Basketball:</td>
						<td><input type="radio" name="basketball" value="Yes">Yes</input></td>
						<td><input type="radio" name="basketball" value="No">No</input></td>				
					</tr>
					<tr>
						<td>Hockey:</td>
						<td><input type="radio" name="hockey" value="Yes">Yes</input></td>
						<td><input type="radio" name="hockey" value="No">No</input></td>				
					</tr>
					<tr>
						<td>Golf:</td>
						<td><input type="radio" name="golf" value="Yes">Yes</input></td>
						<td><input type="radio" name="golf" value="No">No</input></td>				
					</tr>
					<tr>
						<td>Bowling:</td>
						<td><input type="radio" name="bowling" value="Yes">Yes</input></td>
						<td><input type="radio" name="bowling" value="No">No</input></td>				
					</tr>
					<tr>
						<td>Tennis:</td>
						<td><input type="radio" name="tennis" value="Yes">Yes</input></td>
						<td><input type="radio" name="tennis" value="No">No</input></td>				
					</tr>
				</table>
			</td>
			</tr>
			<tr>
			<td>
				<table id="prefs3">
					<tr>
						<th>How much are you willing to spend on an activity?</th>
					</tr>
					<tr>
						<td>
							<select name="mspend">
								<option value="" selected="selected">Select spending limit</option>
								<option value="25">$25</option>
								<option value="50">$50</option>
								<option value="100">$100</option>
								<option value="250">$250</option>
								<option value="500">$500</option>
								<option value="1000">$1000</option>
								<option value="1000-more">More than $1000</option>
							</select>
						</td>
					</tr>		
				</table>
				
			</td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<input type="submit" name="pref-submit" action="UserPreferences.php">
			</td>
			</tr>
			</table>		
			</form>

            <a href="./MoodProfile.php"><h1 id="rlink">Return to Mood Profile</h1></a>
            <a href="./EmotionSelection.php"><h1 id="rlink">Return to Emotion Selection</h1></a>  
		</div>
		<div id="footer" class="footer">
			<p>Copyright &#169; 2014 Doo-Dah, LLC</p>
		</div>
	</body>

<?php

    /* hardcoded uid 2 for user john doe (temporary) */
    $uid = 2;
    $uidd = intval($uid);

	/* establish connection to db */
    $dblink = mysqli_connect($host, $username, $password, $dbname, $port)
        or die(mysqli_connect_error() . ' (Error: ' . mysqli_connect_errno() . ')');

    /* get ids for preferences */
    $qpref = "SELECT * FROM UserPreferences";
    $qprefr = mysqli_query($dblink, $qpref) or die (mysql_error($dblink));

    if (isset($_POST["pref-submit"])) {

    /* loop through all preferences                                              */
    /* update preferences in User_has_UserPreferences table with desired values  */
 	while ($prefrow = mysqli_fetch_array($qprefr, MYSQLI_ASSOC)) {

    	/* checkboxes for each pref are either checked ('yes) or unchecked ('no') (unchecked by default) */
	 	/* radio buttons for each pref are either set to 'yes' or 'no' for a preference                  */
		switch ($prefrow["Name"]) {
			
			/* 'Shopping' checkbox */
        	case "Shopping":
        		/* if checked, update pref in db with 'No' (since check=dislike for these checkboxes) */      	
            	if (isset($_POST["shopping"])) {
            		$q = "UPDATE User_has_UserPreferences SET Value='No' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo "SHOPPING checked and updated with no";  #test*/
        		}
        		/* if unchecked, update pref in db with 'Yes' (since uncheck=like for these checkboxes) */
        		else if (!isset($_POST["shopping"])) {
        			$q = "UPDATE User_has_UserPreferences SET Value='Yes' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo "SHOPPING unchecked and updated with yes";  #test*/
        		}       		
        		break;

        	/* 'Going to the movies' checkbox */
        	case "Movies": 
            	/* if checked, update pref in db with 'No' (since check=dislike for these checkboxes) */      	
            	if (isset($_POST["movies"])) {
            		$q = "UPDATE User_has_UserPreferences SET Value='No' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " MOVIES checked and updated with no";  #test*/
        		}
        		/* if unchecked, update pref in db with 'Yes' (since uncheck=like for these checkboxes) */
        		else if (!isset($_POST["movies"])) {
        			$q = "UPDATE User_has_UserPreferences SET Value='Yes' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo "MOVIES unchecked and updated with yes";  #test*/
        		}       		
        		break;
        	
        	/* 'Eating at restaurants' checkbox */
        	case "Restaurants": 
            	/* if checked, update pref in db with 'No' (since check=dislike for these checkboxes) */      	
            	if (isset($_POST["restaurants"])) {
            		$q = "UPDATE User_has_UserPreferences SET Value='No' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " EATING OUT checked and updated with no";  #test*/
        		}
        		/* if unchecked, update pref in db with 'Yes' (since uncheck=like for these checkboxes) */
        		else if (!isset($_POST["restaurants"])) {
        			$q = "UPDATE User_has_UserPreferences SET Value='Yes' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " RESTAURANTS unchecked and updated with yes";  #test*/
        		}       		
        		break;
        	
        	/* 'Lesuire reading' checkbox */
        	case "Reading": 
            	/* if checked, update pref in db with 'No' (since check=dislike for these checkboxes) */      	
            	if (isset($_POST["reading"])) {
            		$q = "UPDATE User_has_UserPreferences SET Value='No' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " READING checked and updated with no";  #test*/
        		}
        		/* if unchecked, update pref in db with 'Yes' (since uncheck=like for these checkboxes) */
        		else if (!isset($_POST["reading"])) {
        			$q = "UPDATE User_has_UserPreferences SET Value='Yes' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " READING unchecked and updated with yes";  #test*/
        		}       		
        		break;

        	/* 'Music events' checkbox */
        	case "Concerts": 
            	/* if checked, update pref in db with 'No' (since check=dislike for these checkboxes) */      	
            	if (isset($_POST["concerts"])) {
            		$q = "UPDATE User_has_UserPreferences SET Value='No' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " CONCERTS checked and updated with no";  #test*/
        		}
        		/* if unchecked, update pref in db with 'Yes' (since uncheck=like for these checkboxes) */
        		else if (!isset($_POST["concerts"])) {
        			$q = "UPDATE User_has_UserPreferences SET Value='Yes' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " CONCERTS unchecked and updated with yes";  #test*/
        		}       		
        		break;

        	/* 'Playing video games' checkbox */
        	case "Gaming": 
            	/* if checked, update pref in db with 'No' (since check=dislike for these checkboxes) */      	
            	if (isset($_POST["gaming"])) {
            		$q = "UPDATE User_has_UserPreferences SET Value='No' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " GAMING checked and updated with no";  #test*/
        		}
        		/* if unchecked, update pref in db with 'Yes' (since uncheck=like for these checkboxes) */
        		else if (!isset($_POST["gaming"])) {
        			$q = "UPDATE User_has_UserPreferences SET Value='Yes' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " GAMING unchecked and updated with yes";  #test*/
        		}       		
        		break;

        	/* 'Grabbing a drink' checkbox */
        	case "Drink": 
            	/* if checked, update pref in db with 'No' (since check=dislike for these checkboxes) */      	
            	if (isset($_POST["drink"])) {
            		$q = "UPDATE User_has_UserPreferences SET Value='No' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " DRINK checked and updated with yes";  #test*/
        		}
        		/* if unchecked, update pref in db with 'Yes' (since uncheck=like for these checkboxes) */
        		else if (!isset($_POST["drink"])) {
        			$q = "UPDATE User_has_UserPreferences SET Value='Yes' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " DRINK unchecked and updated with no";  #test*/
        		}       		
        		break;

        	/* 'Outdoorsy stuff' checkbox */
        	case "Outdoors": 
            	/* if checked, update pref in db with 'No' (since check=dislike for these checkboxes) */      	
            	if (isset($_POST["outdoors"])) {
            		$q = "UPDATE User_has_UserPreferences SET Value='No' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " OUTDOORS checked and updated with yes";  #test*/
        		}
        		/* if unchecked, update pref in db with 'Yes' (since uncheck=like for these checkboxes) */
        		else if (!isset($_POST["outdoors"])) {
        			$q = "UPDATE User_has_UserPreferences SET Value='Yes' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " OUTDOORS unchecked and updated with no";  #test*/
        		}       		
        		break;

        	/* 'Baseball' radio buttons */
        	case "Baseball":
        		/* if yes or no chosen, enter value into db */
        		if (isset($_POST["baseball"])) {        			
        			$q = "UPDATE User_has_UserPreferences SET Value='".$_POST["baseball"]."' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " BASEBALL updated with ".$_POST["baseball"];  #test*/
        		}
        		/* if yes or no not chosen, do nothing */
        		else if (!isset($_POST["baseball"])) {
        			break;
        		}
        		break;

        	/* 'Football' radio buttons */
        	case "Football":
        		/* if yes or no chosen, enter value into db */
        		if (isset($_POST["football"])) {        			
        			$q = "UPDATE User_has_UserPreferences SET Value='".$_POST["football"]."' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " FOOTBALL updated with ".$_POST["football"];  #test*/
        		}
        		/* if yes or no not chosen, do nothing */
        		else if (!isset($_POST["football"])) {
        			break;
        		}
        		break;

        	/* 'Basketball' radio buttons */
        	case "Basketball":
        		/* if yes or no chosen, enter value into db */
        		if (isset($_POST["basketball"])) {        			
        			$q = "UPDATE User_has_UserPreferences SET Value='".$_POST["basketball"]."' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " BASKETBALL updated with ".$_POST["basketball"];  #test*/
        		}
        		/* if yes or no not chosen, do nothing */
        		else if (!isset($_POST["basketball"])) {
        			break;
        		}
        		break;

        	/* 'Hockey' radio buttons */
        	case "Hockey":
        		/* if yes or no chosen, enter value into db */
        		if (isset($_POST["hockey"])) {        			
        			$q = "UPDATE User_has_UserPreferences SET Value='".$_POST["hockey"]."' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " HOCKEY updated with ".$_POST["hockey"];  #test*/
        		}
        		/* if yes or no not chosen, do nothing */
        		else if (!isset($_POST["hockey"])) {
        			break;
        		}
        		break;

        	/* 'Golf' radio buttons */
        	case "Golf":
        		/* if yes or no chosen, enter value into db */
        		if (isset($_POST["golf"])) {        			
        			$q = "UPDATE User_has_UserPreferences SET Value='".$_POST["golf"]."' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " GOLF updated with ".$_POST["golf"];  #test*/
        		}
        		/* if yes or no not chosen, do nothing */
        		else if (!isset($_POST["golf"])) {
        			break;
        		}
        		break;

        	/* 'Bowling' radio buttons */
        	case "Bowling":
        		/* if yes or no chosen, enter value into db */
        		if (isset($_POST["bowling"])) {        			
        			$q = "UPDATE User_has_UserPreferences SET Value='".$_POST["bowling"]."' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " BOWLING updated with ".$_POST["bowling"];  #test*/
        		}
        		/* if yes or no not chosen, do nothing */
        		else if (!isset($_POST["bowling"])) {
        			break;
        		}
        		break;

        	/* 'Tennis' radio buttons */
        	case "Tennis":
        		/* if yes or no chosen, enter value into db */
        		if (isset($_POST["tennis"])) {        			
        			$q = "UPDATE User_has_UserPreferences SET Value='".$_POST["tennis"]."' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
        			/*echo " BASEBALL updated with ".$_POST["tennis"];  #test*/
        		}
        		/* if yes or no not chosen, do nothing */
        		else if (!isset($_POST["tennis"])) {
        			break;
        		}
        		break;

        	/* Max price dropdown */
        	case "Max spending":
        		/* if no value selected in dropdown list, do nothing */
        		if($_POST["mspend"] == "") {
        			break;
        		}
        		/* otherwise, update db with selected value */
        		else {
        			$q = "UPDATE User_has_UserPreferences SET Value='".$_POST["mspend"]."' WHERE";
            		$q .= " User_Id=".intval($uidd)." AND UserPreferences_Id=".$prefrow["Id"];
        			$qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
       				/*echo " MAX SPENDING updated with ".$_POST["mspend"];  #test*/
       			}
        		break;

        } /* end switch */
    } /* end while */
    } /* end if */

    reset($_POST);
    mysqli_close($dblink);

?>	

</html>
