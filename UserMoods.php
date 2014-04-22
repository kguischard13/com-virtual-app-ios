<?php

    include("const_db.inc"); 
    include("ChromePhp.php"); 

    /* hardcoded uid 2 for user john doe (temporary) */
    $uid = 2;

    $afraid_id = $_POST["afraid"];
    $angry_id = $_POST["angry"];
    $anxious_id = $_POST["anxious"];
    $confident_id = $_POST["confident"];
    $dread_id = $_POST["dread"];
    $happy_id = $_POST["happy"];
    $lonely_id = $_POST["lonely"];
    $regret_id = $_POST["regret"];
    $sad_id = $_POST["sad"];

    date_default_timezone_set('America/New_York');

    $dblink = mysqli_connect($host, $username, $password, $dbname, $port)
        or die(mysqli_connect_error() . ' (Error: ' . mysqli_connect_errno() . ')');

    if (isset($_POST["afraid"])) {
        $q = "INSERT INTO User_has_Mood VALUES ('$uid', '$afraid_id', '";
        $q .= date("Y-m-d H:i:s");
        $q .= "')";
        $qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
    }

    else if (isset($_POST["angry"])) {
        $q = "INSERT INTO User_has_Mood VALUES ('$uid', '$angry_id', '";
        $q .= date("Y-m-d H:i:s");
        $q .= "')";
        $qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
    }

    else if (isset($_POST["anxious"])) {
        $q = "INSERT INTO User_has_Mood VALUES ('$uid', '$anxious_id', '";
        $q .= date("Y-m-d H:i:s");
        $q .= "')";
        $qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
    }

    else if (isset($_POST["confident"])) {
        $q = "INSERT INTO User_has_Mood VALUES ('$uid', '$confident_id', '";
        $q .= date("Y-m-d H:i:s");
        $q .= "')";
        $qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
    }

    else if (isset($_POST["dread"])) {
        $q = "INSERT INTO User_has_Mood VALUES ('$uid', '$dread_id', '";
        $q .= date("Y-m-d H:i:s");
        $q .= "')";
        $qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
    }

     else if (isset($_POST["happy"])) {
        $q = "INSERT INTO User_has_Mood VALUES ('$uid', '$happy_id', '";
        $q .= date("Y-m-d H:i:s");
        $q .= "')";
        $qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
    }

     else if (isset($_POST["lonely"])) {
        $q = "INSERT INTO User_has_Mood VALUES ('$uid', '$lonely_id', '";
        $q .= date("Y-m-d H:i:s");
        $q .= "')";
        $qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
    }

     else if (isset($_POST["regret"])) {
        $q = "INSERT INTO User_has_Mood VALUES ('$uid', '$regret_id', '";
        $q .= date("Y-m-d H:i:s");
        $q .= "')";
        $qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
    }

     else if (isset($_POST["sad"])) {
        $q = "INSERT INTO User_has_Mood VALUES ('$uid', '$sad_id', '";
        $q .= date("Y-m-d H:i:s");
        $q .= "')";
        $qres = mysqli_query($dblink, $q) or die (mysqli_error($dblink));
    }

    reset($_POST);
  	mysqli_close($dblink);

?>
