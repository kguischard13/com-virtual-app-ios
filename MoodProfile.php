<?php
	include("const_db.inc");
	session_start(); 
	if(!isset($_SESSION['UserId']))
	{
		header("Location: Logout.php"); 
	}
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Doo-Dah - Mood Profile</title>
        <script src="./js/jquery-1.11.0.js"></script>
        <script src="./js/jquery-ui-1.10.4/ui/jquery-ui.js"></script>
        <script type="text/javascript" src="./js/ViewScripts/General.js"></script>
        <link rel="stylesheet" type="text/css" href="./css/General.css"/>
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

        <?php
            // establish connection to db
            $dblink = mysqli_connect($host, $username, $password, $dbname, $port)
                or die(mysqli_connect_error() . ' (Error: ' . mysqli_connect_errno() . ')');

            // execute query that retrieves entries from User_has_mood table
            $q = "SELECT * FROM User_has_mood";
            $qres = mysqli_query($dblink, $q)
                or die(mysqli_error($dblink));

            // execute query that retrieves entries from User_has_activity table
            $q = "SELECT * FROM User_has_mood";
            $qres = mysqli_query($dblink, $q)
                or die(mysqli_error($dblink));
        ?>

        <!-- mood profile -->
        
        <div class="page-content">
            <h1 id="header-text">Mood Profile</h1>
                <table id="mview">
                    <tr>
                        <th>Your mood</th>
                        <th>Date entered</th>
                    </tr>
                    <?php
                    // populate table with user mood data
                    while ( $row=mysqli_fetch_array($qres) ) {
                        echo '<tr>';
                            if($row["Mood_Id"] == '0')
                                echo '<td>Afraid</td>';
                            if($row["Mood_Id"] == '1')
                                echo '<td>Angry</td>';
                            if($row["Mood_Id"] == '2')
                                echo '<td>Anxious</td>';
                            if($row["Mood_Id"] == '3')
                                echo '<td>Confident</td>';
                            if($row["Mood_Id"] == '4')
                                echo '<td>Dread</td>';
                            if($row["Mood_Id"] == '5')
                                echo '<td>Happy</td>';
                            if($row["Mood_Id"] == '6')
                                echo '<td>Lonely</td>';
                            if($row["Mood_Id"] == '7')
                                echo '<td>Regret</td>';
                            if($row["Mood_Id"] == '8')
                                echo '<td>Sad</td>';                              
                            echo '<td>'.$row["MoodDate"].'</td>';
                        echo '</tr>';
                    }
                    ?>
                </table>           
            
            <br>
            <a href="./UserPreferences.php"><h1 id="mplink">Set your preferences</h1></a>
            <a href="./EmotionSelection.php"><h1 id="rlink">Return to Emotion Selection</h1></a> 
            
            </div>           

        <div class="footer">
			<p>Copyright &#169; 2014 Doo-Dah, LLC</p>
        </div>

    </body>

</html>
