
<?php 
$name = "localhost";
$username = "aglefed";
$password = "Ahrirule34";
$dbname = "TeamInfo";

$conn = new mysqli($name, $username, $password, $dbname);
/* session_start(); */
$text1 = $_POST['text1'];
$text2 = $_POST['text2'];
//$text2 = $_POST['text2'];
$request = "SELECT * FROM login WHERE user = '";
$request .= $text1;
$request .= "' and pass = '".$text2."';";
/* $request .= "' and pass = '";
$request .= $text2;
$request .= "'"; */
$result = $conn->query($request);
$data = array();
//while($row = mysqli_fetch_assoc($query))
/* if(!$result->fetch_assoc())
{
    echo "incorrect login";
}
else { */
while($row = $result->fetch_assoc())
{
    $data[] = $row;
} 
echo json_encode($data);
/* } */
?>
