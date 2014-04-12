<!-- User Preferences -->
<!--  Most likely tables will be changed to divs for final -->
<?php

?>

<!DOCTYPE html>
<html>
    <head>
        <title>Doo-Dah - Mood Selection</title>
        <script src="./js/jquery-1.11.0.js"></script>
        <script src="./js/jquery-ui-1.10.4/ui/jquery-ui.js"></script>
        <script type="text/javascript" src="./js/HomeView.js"></script>
        <link rel="stylesheet" type="text/css" href="./css/General.css"/>
        <link rel="stylesheet" type="text/css" href="./css/HomeView.css"/>
        <link rel="stylesheet" type="text/css" href="./css/UserPreferencesView.css"/>
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
						</ul>
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
						<td><input type="checkbox" name="restaurants" value="restaraunts">Eating at restaurants</input></td>
						<td><input type="checkbox" name="reading" value="reading">Leisure reading</input></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="music" value="music">Music events</input></td>
						<td><input type="checkbox" name="videogames" value="videogames">Playing video games</input></td>
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
						<td><input type="radio" name="baseball-yes" value="baseball-yes">Yes</input></td>
						<td><input type="radio" name="baseball-no" value="baseball-no">No</input></td>				
					</tr>
					<tr>
						<td>Football:</td>
						<td><input type="radio" name="football-yes" value="football-yes">Yes</input></td>
						<td><input type="radio" name="football-no" value="football-no">No</input></td>				
					</tr>
					<tr>
						<td>Basketball:</td>
						<td><input type="radio" name="basketball-yes" value="basketball-yes">Yes</input></td>
						<td><input type="radio" name="basketball-no" value="basketball-no">No</input></td>				
					</tr>
					<tr>
						<td>Hockey:</td>
						<td><input type="radio" name="hockey-yes" value="hockey-yes">Yes</input></td>
						<td><input type="radio" name="hockey-no" value="hockey-no">No</input></td>				
					</tr>
					<tr>
						<td>Golf:</td>
						<td><input type="radio" name="golf-yes" value="golf-yes">Yes</input></td>
						<td><input type="radio" name="golf-no" value="golf-no">No</input></td>				
					</tr>
					<tr>
						<td>Bowling:</td>
						<td><input type="radio" name="bowling-yes" value="bowling-yes">Yes</input></td>
						<td><input type="radio" name="bowling-no" value="bowling-no">No</input></td>				
					</tr>
					<tr>
						<td>Tennis:</td>
						<td><input type="radio" name="tennis-yes" value="tennis-yes">Yes</input></td>
						<td><input type="radio" name="tennis-no" value="tennis-no">No</input></td>				
					</tr>
					<tr>
						<td>Horse Racing:</td>
						<td><input type="radio" name="hracing-yes" value="hracing-yes">Yes</input></td>
						<td><input type="radio" name="hracing-no" value="hracing-no">No</input></td>				
					</tr>
					<tr>
						<td>Car Racing:</td>
						<td><input type="radio" name="cracing-yes" value="cracing-yes">Yes</input></td>
						<td><input type="radio" name="cracing-no" value="cracing-no">No</input></td>				
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
							<select>
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
				<input type="submit" name="pref-submit" action="#">
			</td>
			</tr>
			</table>		
			</form>
		</div>

	</body>

</html>