<?php 
$name = "localhost";
$username = "aglefed";
$password = "Ahrirule34";
$dbname = "TeamInfo";

$conn = new mysqli($name, $username, $password, $dbname);
$text1 = $_POST['text1'];
//$text2 = $_POST['text2'];
$request = "SELECT * FROM login WHERE user = '";
$request .= $text1;
$request .= "'";
$result = $conn->query($request);
$data = array();
while($row = $result->fetch_assoc())
{
    $data[] = $row;
} 
echo json_encode($data);
?>
