<!DOCTYPE html>
<html>
    <head>
        <title>Doo-Dah - Mood Selection</title>
        <script src="./js/jquery-1.11.0.js"></script>
        <script src="./js/jquery-ui-1.10.4/ui/jquery-ui.js"></script>
        <script type="text/javascript" src="./js/HomeView.js"></script>
        <link rel="stylesheet" type="text/css" href="./css/General.css"/>
        <link rel="stylesheet" type="text/css" href="./css/HomeView.css"/>
        <link rel="stylesheet" type="text/css" href="./css/EmotionSelectionView.css"/>
    </head>

    <body>
        <div id="container">
            <div id="top-navigation">
                <div id="navigation">
                    <div id="nav-list">
                        <ul>
                            <li class="top-level"><a href="./HomeView.html" id="home">Home</a></li>
                            <li class="top-level"><a href="#" id="how" title="Take the tutorial if you are a newcomer or view help documentation.">How it works?</a></li>
                            <li class="top-level"><a href="./EmotionSelection.php" id="emotions" title="Pick your current emotion to view new activities.">Emotions</a></li>
                            <li class="top-level"><a href="./ActivityView.html" id="activities" title="View your recent, favorite, or trending activities.">Activities</a></li>
                            <li class="top-level"><a href="#" id="account">My Account</a>
                                <ul id="sub-menu">
                                    <li class="sub-level"><a href="./LoginView.html" id="login" title="Log in if you already have an account.">Login</a></li>
                                    <li class="sub-level"><a href="./RegistrationView.html" id="new-user" title="New users, register here">Sign up</a></li>
                                    <li class="sub-level"><a href="#" id="forgot-password" title="Forgot your password?">Forgot my password</a></li>

                                </ul>
                            </li>       
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- mood buttons -->
        <div class="page-content">
        	<div id="welcome-mood">
        		<h1 id="header-text">What mood are you in?</h1>
					<form action="./ActivityView.html" method="post">
                    <table>
						<tr>
                            <td>
                                <div id="mbutton-confident">
                                    <input type="image" name="confident" value="confident" src="./img/mb/confident.png">
                                </div>
                            </td>
                            <td>
                                <div id="mbutton-happy">
                                    <input type="image" name="happy" value="happy" src="./img/mb/happy.png">
                                </div>
                            </td>
                            <td>
                                <div id="mbutton-anxious">
                                    <input type="image" name="anxious" value="anxious" src="./img/mb/anxious.png">
                                </div>
                            </td>
						</tr>
						<tr>
                            <td>
                                <div id="mbutton-afraid">
                                    <input type="image" name="afraid" value="afraid" src="./img/mb/afraid.png">
                                </div>
                            </td>
                            <td>
                                <div id="mbutton-angry">
                                    <input type="image" name="angry" value="angry" src="./img/mb/angry.png">
                                </div>
                            </td>
                            <td>
                                <div id="mbutton-dread">
                                    <input type="image" name="dread" value="dread" src="./img/mb/dread.png">
                                </div>
                            </td>
						<tr>           
                            <td>
                                <div id="mbutton-lonely">
                                    <input type="image" name="lonely" value="lonely" src="./img/mb/lonely.png">
                                </div>
                            </td>
                            <td>
                                <div id="mbutton-regret">
                                    <input type="image" name="regret" value="regret" src="./img/mb/regret.png">
                                </div>
                            </td>
                            <td>
                                <div id="mbutton-sad">
                                    <input type="image" name="sad" value="sad" src="./img/mb/sad.png">
                                </div>
                            </td>
						</tr>
					</table> 
                </form>
			</div> 

            <br>

            <div id="welcome-mood">
                <a href="./MoodProfile.php"><h1 id="header-text">Click here to view your mood profile</h1></a>
            </div>

        </div>

        <div id="footer"></div>

    </body>

</html>
