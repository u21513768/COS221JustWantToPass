<?php
session_start();

    include("../login/connection.php");
    include("../login/functions.php");
    include("functions.php");

    $user_data = check_if_login($con);
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Swimmers</title>
    </head>
    <body>
        <a href="../login/logout.php">logout</a>
        <a href="event.php">Events</a>
        <a href="race.php">Races</a>
        <a href="swimmer.php">Swimmer</a>
        <a href="team.php">Team</a>
        <h1>This is the Swimmers page</h1>
        Hello <?php echo $user_data['user_name'];   ?><br/><br/>

        <input type="submit" name="getSwimmers" value="Display All Swimmers"/><br/><br/>
        <input type="text" name="query_ID" id="query_ID" value="Query Swimmer by ID"/>
        <input type="submit" name="search_ID" value="Search"/><br/><br/>

        <input type="text" name="Fname" id="Fname" value="First Name"/>
        <input type="text" name="Lname" id="Lname" value="Last Name"/>
        <input type="text" name="sex" id="sex" value="Sex"/>
        <input type="submit" name="input_data" value="Add"/><br/><br/>
    </body>
</html>