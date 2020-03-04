<?php

$servername = "localhost";
$username = "root";
$password = "Password1";
$db = "legacy_tech";

// Create connection
$conn = new mysqli($servername, $username, $password, $db);

// Check connection
if (!$conn) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

$sql = "SELECT STD_ID, STD_FNAME, STD_LNAME, STD_COVER_LETTER FROM student";


// data for output

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["STD_ID"]. " - Name: " . $row["STD_FNAME"]. " " . $row["STD_LNAME"]. " ". $row["STD_COVER_LETTER"]. "<br>";
	$id = $row["STD_ID"];
	$fname = $row["STD_FNAME"];
	$lname = $row["STD_LNAME"];
	$disc = $row["STD_COVER_LETTER"];
    }
} else {
    echo "0 results";
}
$conn->close();


?>