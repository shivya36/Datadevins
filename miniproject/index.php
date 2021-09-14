<h1>Hello Datadewins</h1>
<h4>Attempting MYSQL Connection.....</h4>
<?php
$host = 'db';
$user = 'MYSQL_USER';
$pass = 'MYSQL_PASSWORD';
$db = 'my_db';
$conn = new mysqli($host, $user, $pass, $db);

if($conn->connect_error) {
     die("Connection failed: " . $conn->connect_error);
}

echo("Server version is: ");
echo($conn->server_version);
?>
