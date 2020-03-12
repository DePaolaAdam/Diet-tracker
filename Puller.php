
<?php 
$name = "localhost";
$username = "aglefed";
$password = "Ahrirule34";
$dbname = "TeamInfo";

$conn = new mysqli($name, $username, $password, $dbname);
/* session_start(); */
$text1 = $_POST['text1'];
$request = "SELECT * FROM FoodWitch WHERE food = '";
$request .= $text1;
$request .= "'";
$result = $conn->query($request);
$data = array();
//while($row = mysqli_fetch_assoc($query))
while($row = $result->fetch_assoc())
{
    $data[] = $row;
} 
echo json_encode($data);
?>
