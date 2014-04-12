<?php
    include("const_db.inc");
    date_default_timezone_set('Australia/Melbourne');

    // establish connection to db
    $dblink = mysqli_connect('localhost', $username, $password, $dbname)
        or die(mysqli_connect_error() . ' (Error: ' . mysqli_connect_errno() . ')');
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
        <link rel="stylesheet" type="text/css" href="./css/EmotionSelectionView.css"/>
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

        <!-- mood buttons -->
        <div class="page-content">
            <h1 id="header-text">What mood are you in?</h1>
                <form name="mbuttons" action="./ActivityView.php" method="POST">
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
            <br>
            <a href="./MoodProfile.php"><h1 id="header-text">Click here to view your mood profile</h1></a>        
        </div>

        <div id="footer"></div>

    </body>

    <?php
        if (isset($_POST["afraid"])) {
            $q = "INSERT INTO User_has_Mood VALUES (1, 1, " . date('d-m-Y H:i:s', time()) . ")";
            $qres = mysqli_query($dblink,$q) or die (mysqli_error($dblink));
        }

        else if (isset($_POST["angry"])) {
            $q = "INSERT INTO User_has_Mood VALUES (1, 2, " . date('d-m-Y H:i:s', time()) . ")";
            $qres = mysqli_query($dblink,$q) or die (mysqli_error($dblink));
        }

        else if (isset($_POST["anxious"])) {
            $q = "INSERT INTO User_has_Mood VALUES (1, 3, " . date('d-m-Y H:i:s', time()) . ")";
            $qres = mysqli_query($dblink,$q) or die (mysqli_error($dblink));
        }

        else if (isset($_POST["confident"])) {
            $q = "INSERT INTO User_has_Mood VALUES (1, 4, " . date('d-m-Y H:i:s', time()) . ")";
            $qres = mysqli_query($dblink,$q) or die (mysqli_error($dblink));
        }

        else if (isset($_POST["dread"])) {
            $q = "INSERT INTO User_has_Mood VALUES (1, 5, " . date('d-m-Y H:i:s', time()) . ")";
            $qres = mysqli_query($dblink,$q) or die (mysqli_error($dblink));
        }

         else if (isset($_POST["happy"])) {
            $q = "INSERT INTO User_has_Mood VALUES (1, 6, " . date('d-m-Y H:i:s', time()) . ")";
            $qres = mysqli_query($dblink,$q) or die (mysqli_error($dblink));
        }

         else if (isset($_POST["lonely"])) {
            $q = "INSERT INTO User_has_Mood VALUES (1, 7, " . date('d-m-Y H:i:s', time()) . ")";
            $qres = mysqli_query($dblink,$q) or die (mysqli_error($dblink));
        }

         else if (isset($_POST["regret"])) {
            $q = "INSERT INTO User_has_Mood VALUES (1, 8, " . date('d-m-Y H:i:s', time()) . ")";
            $qres = mysqli_query($dblink,$q) or die (mysqli_error($dblink));
        }

         else if (isset($_POST["sad"])) {
            $q = "INSERT INTO User_has_Mood VALUES (1, 9, " . date('d-m-Y H:i:s', time()) . ")";
            $qres = mysqli_query($dblink,$q) or die (mysqli_error($dblink));
        }
    ?>

</html>
