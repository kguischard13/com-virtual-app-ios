<?php

?>


<!DOCTYPE html>
<html>
	<head>
		<title>Doo-Dah - Activities</title>
		<script type="text/javascript" src="./js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="./js/jquery-ui-1.10.4/ui/jquery-ui.js"></script>
		<script type="text/javascript" src="./js/Enums.js"></script>	
		<script type="text/javascript" src="./js/Services/ActivityService.js"></script>			
		<script type="text/javascript" src="./js/js_global.js"></script>			
		<script type="text/javascript" src="./js/HomeView.js"></script>
		<script type="text/javascript" src="./js/ActivityView.js"></script>
		<script type="text/javascript" src="./js/Controls/FilterControl.js"></script>
		<script type="text/javascript" src="./js/Controls/ActivitySummaryViewControl.js"></script>
		<link rel="stylesheet" type="text/css" href="./css/HomeView.css"/>
		<link rel="stylesheet" type="text/css" href="./css/General.css"/>
		<link rel="stylesheet" type="text/css" href="./css/ActivityView.css"/>
		<link rel="stylesheet" type="text/css" href="./css/FilterControl.css"/>
		<link rel="stylesheet" type="text/css" href="./css/ActivitySummaryViewControl.css"/>
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
		
		<div class="page-content">
			<div id="welcome-activities">
				<h1 id="header-text">Activities</h1>
					<div id="user-info"></div>
					<div id="pnlFilterControl"></div>
					<div id="result-list">
						<div id="ctrlActivitySummaryView" class="activity-list-item"></div>
						<div id="summaryView2" class="activity-list-item"></div>
					</div>
					<button id="btnActivities">GetActivities</button>
			</div>
		</div>
		<div id="footer" class="footer">
			<p>Copyright 2014 Doo-Dah Inc</p>
		</div>

	</body>

</html>