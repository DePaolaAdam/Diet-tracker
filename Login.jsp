<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<script type="text/javascript" src="app/Diethelp.js"></script>
<style>
body, html{
height: 100%;
background-position: center;
background-repeat: no-repeat;
background-size: cover;
text-align: center;
}

input
{
	width: 25%;
	background-color: white;
	color: #A0A0A0;
	border: 1px solid gray;
	border-bottom: 1px solid gray;
	outline: none;
	height 20px;
	transition:height 1s;
	display: inline-block;
	box-sizing: border-box;
	text-align: center;
	margin: auto;
	padding: 12px 20px;
	border-radius: 15px;
}
div
{
	text-align: center;
}
#button
{
	width: 25%;
	padding: 12px 20px;
	background-color: #32CD32;
	color: white;
	border: 1px solid black;
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
}
#account
{
	width: 25%;
	padding: 12px 20px;
	background-color: #32CD32;
	color: white;
	border: 1px solid black;
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
}
p, h1
{
	color: white;
	text-align: center;
}
#container
{
	margin-left: auto;
	margin-right: auto;
	background-color: #f1f1f1;
	padding-top: 5%;
	padding-bottom: 5%;
	width: 50%;
	border-radius: 5px;
}
</style>
</head>
<body background = "light-blue-background-3.jpg">
	<h1>Login</h1>
	<span id="result1"></span>
	<!-- <div id = container> -->
	<p></p>
	<input type="text" placeholder="Username" id="text1">
	<p></p>
	<input type="password" placeholder="Password" id="text2">
	<p></p>
	<button id = "button">login</button>
	<p></p>
	<!-- </div> -->
	
	<p id="demo"></p>
	<script type="text/javascript">
	var mf = "male";
	$('#button').click(function(){
	var val1 = $('#text1').val();
	var val2 = $('#text2').val();
	$.ajax({
		url: 'authentic.php',
		datatype: "json",
		data: {text1: val1, text2: val2},
		type: 'POST',
		success: function(data){
 			var s = JSON.stringify(data);
			var lbraceremove = s.replace("[", "");
			var rbraceremove = lbraceremove.replace("]", "");
			var rnremove = rbraceremove.replace(/(?:\\[rn])+/g, "");
			var bslashremove = rnremove.replace(/\\/g, "");
			var spaceadd = bslashremove.replace(",", ", ");
			var aposremove = spaceadd.substring(1, spaceadd.length - 1);
			var response = JSON.parse(aposremove);
			//document.getElementById("test").innerHTML += data;
			if(response.user == document.getElementById('text1').value)
			{
				localStorage.setItem("username", val1);
				localStorage.setItem("keto", response.keto);
				localStorage.setItem("vegan", response.vegan);
				document.location.href="Nutrients.jsp";
			} 
			else 
			{
				//window.location.href = "Nutrients.jsp";
				document.getElementById("test").innerHTML += "incorrect login";
			}
		}
		
/* 		complete: function(data, error)
		{
			document.getElementById("result1").innerHTML += "incorrect login information";
		} 
		
		error: function(xhr, status, error) {
			alert(error);
			//document.getElementById("result1").innerHTML += "error login information";
		}  */
	});
	});
	</script>
	<p id = "test"></p>
	<p>Create an account</p>
	<div>
	<form method = "get" action = "Create.jsp">
	<button id="account">Sign-up</button>
	</form>
	</div>
</body>
</html>
