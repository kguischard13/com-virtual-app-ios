<?php

session_start(); 
    if(isset($_SESSION['UserId']))
    {
    	include("const_db.inc");
    	date_default_timezone_set('America/New_York');

		// establish connection to db
		$dblink = mysqli_connect($host, $username, $password, $dbname, $port)
			or die(mysqli_connect_error() . ' (Error: ' . mysqli_connect_errno() . ')');
    }
    else
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
        <link rel="stylesheet" type="text/css" href="./css/EmotionSelectionView.css"/>
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

        <!-- mood buttons -->
        <div class="page-content">
            <h1 id="header-text">What mood are you in?</h1>
                <form name="mbuttons" action="./ActivityView.php" method="post">
                    <table>
                        <tr>
                            <td>
                                <input id="mbutton-confident" type="image" name="confident" value = "4" src="./img/mb/confident.png">
                            </td>
                            <td>
                                <input id="mbutton-happy" type="image" name="happy" value="6" src="./img/mb/happy.png">
                            </td>
                            <td>
                                <input id="mbutton-anxious" type="image" name="anxious" value="3" src="./img/mb/anxious.png">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="mbutton-afraid" type="image" name="afraid" value="1" src="./img/mb/afraid.png">
                            </td>
                            <td>
                                <input id="mbutton-angry" type="image" name="anxious" value="2" src="./img/mb/angry.png">
                            </td>
                            <td>
                                <input id="mbutton-dread" type="image" name="dread" value="5" src="./img/mb/dread.png">
                            </td>
                        <tr>           
                            <td>
                                <input id="mbutton-lonely" type="image" name="lonely" value="7" src="./img/mb/lonely.png">
                            </td>
                            <td>
                                <input id="mbutton-regret" type="image" name="regret" value="8" src="./img/mb/regret.png">
                            </td>
                            <td>
                                <input id="mbutton-sad" type="image" name="sad" value="9" src="./img/mb/sad.png">
                            </td>
                        </tr>
                    </table>
                </form>
            <br>
            
            <a href="./MoodProfile.php"><h1 id="mblink">Click here to see your mood profile</h1></a>
            
        </div>

        <div id="footer" class="footer">
			<p>Copyright &#169; 2014 Doo-Dah, LLC</p>        
        </div>

    </body>

</html>
