<?php

?>

<!DOCTYPE html>
<html>
    <head>
        <title>Doo-Dah - Login</title>
        <script src="./js/jquery-1.11.0.js"></script>
        <script src="./js/jquery-ui-1.10.4/ui/jquery-ui.js"></script>
        <script type="text/javascript" src="./js/ViewScriptsHomeView.js"></script>
		<link rel="stylesheet" type="text/css" href="./css/General.css"/>
        <link rel="stylesheet" type="text/css" href="./css/HomeView.css"/>
        <link rel="stylesheet" type="text/css" href="./css/LoginView.css"/>
    </head>

    <body>
        <div id="container">
			<div id="top-navigation">
				<div id="navigation">
					<div id="nav-list">
						<ul>
							<li class="top-level"><a href="./HomeView.php" id="home">Home</a></li>
							<li class="top-level"><a href="#" id="how" title="Take the tutorial if you are a newcomer or view help documentation.">How it works?</a></li>
							<li class="top-level"><a href="./EmotionSelection.php" id="emotions" title="Pick your current emotion to view new activities.">Emotions</a></li>
							<li class="top-level"><a href="./ActivityView.php" id="activities" title="View your recent, favorite, or trending activities.">Activities</a></li>
							<li class="top-level"><a href="#" id="account">My Account</a>
								<ul id="sub-menu">
									<li class="sub-level"><a href="./LoginView.php" id="login" title="Log in if you already have an account.">Login</a></li>
									<li class="sub-level"><a href="./RegistrationView.php" id="new-user" title="New users, register here">Sign up</a></li>
									<li class="sub-level"><a href="#" id="forgot-password" title="Forgot your password?">Forgot my password</a></li>

								</ul>
							</li>		
						</ul
					</div>
				</div>
			</div>
        </div>
        
        <!-- login fields -->
        <div class="page-content">
            <h1 id="header-text">Login to your account</h1>
            <table>
                <tr>
                    <td>Username:</td>
                    <td><input style="width: 175px;" type="text" placeholder="Enter username"></input></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input style="width: 175px;" type="password" placeholder="Enter password"></input></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type='button' id="login-button" name="submit" target="#" class='btn-form'>Log In</button></td>
                </tr>
               <tr>
                    <td></td>
                    <td><button type='button' id="login-button" name="forgot-pw" target="#" class='btn-form'>Forget Password?</button></td>
                </tr>                
            </table>              
        </div>
        

        <div id="footer" class="footer">
            <p>Copyright 2014 Doo-Dah Inc</p>
        </div>

    </body>

</html>