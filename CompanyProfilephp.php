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


$sql = "SELECT CO_NAME, CO_CITY, CO_ADDRESS FROM company";


// data for output

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
    
	$cname = $row["CO_NAME"];
	$city = $row["CO_CITY"];
	$add = $row["CO_ADDRESS"];
	
    }
} else {
    echo "0 results";
}
$conn->close();


?>