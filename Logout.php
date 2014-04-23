<?php
	session_start();
	unset($_SESSION['UserId']);
	session_destroy();
	header("Location: HomeView.php")
?>