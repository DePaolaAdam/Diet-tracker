<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href = "Nutrient.css" rel = "stylesheet">
<script type="text/javascript" src="app/Diethelp.js"></script>
<title>Account Creation</title>
<style>
#male {
  background-color: white;
  color: red;
  font-size: 20px;
  cursor: pointer;
}
#female{
  background-color: white;
  color: red;
  font-size: 20px;
  cursor: pointer;
}
body, html{
height: 100%;
background-position: center;
background-repeat: no-repeat;
background-size: cover;
}
h1
{
	color: white;
}
input
{
	border: 1px solid transparent;
	width: 25%;
	padding: 10px;
	font-size: 16px;
	border-radius: 10px;
}
#weight
{
	vertical-align: middle;
}
p
{
	color: white;
}
#submit
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
</style>
</head>
<body background = "light-blue-background-3.jpg">
	<h1>Create an account</h1>
	<div id = container>
	<p>Enter username and password</p>
	<input type="text" placeholder="Enter username" id="text1">
	<input type="password" placeholder="Enter password" id="text2">
	<p></p>
	<p>Enter your weight in pounds</p>
	<input type="text" placeholder="Enter weight in pounds" id="text3">
	<p>Enter your Height:</p>
	<input type="text" placeholder="feet" id="text40">
	<input type="text" placeholder="inches" id="text41">
	<p></p>
	<p>Enter your age</p>
	<input type="text" placeholder="Enter age" id="text5">
<p></p>
<p id = "weight">Weight goals?</p>
<select id = "selector">
<option value="lose">lose weight</option>
<option value="maintain">maintain weight</option>
<option value="gain">gain weight</option>
</select>
<p></p>
<p>Are you on a ketogenic diet?</p>
<select id = "keto">
<option value = "no">no</option>
<option value = "yes">yes</option>
</select>
<p></p>
<p>Are you on a vegan diet?</p>
<select id = "vegan">
<option value = "nope">no</option>
<option value = "yep">yes</option>
</select>
	<p id = "extend"></p>
	<button id = "male" type = "button" onclick = "changeMale()">male</button>
	<button id = "female" type = "button" onclick = "changeFemale()">female</button>
	<p></p>
	<button id = "submit" type = "button" onclick = "jax()">Create account</button>
	</div>
	<script type="text/javascript">
	var gender = "none";
	function changeMale() {
		gender = "male";
        $('#male').css({
        	'background-color': 'red',
        	'color': 'white',
        	'font-size': '20px'
        })
		$('#female').css({
        	'background-color': 'white',
        	'color': 'red',
        	'font-size': '20px'
        })
    }
	function changeFemale()
	{
		gender = "female";
        $('#female').css({
        	'background-color': 'red',
        	'color': 'white',
        	'font-size': '20px'
        })
        $('#male').css({
        	'background-color': 'white',
        	'color': 'red',
        	'font-size': '20px'
        })
        
	}
	function jax(){
		var val1 = $('#text1').val();
		var val2 = $('#text2').val();
		var val3 = $('#text3').val();
		//var val4 = (parseFloat($('#text40').val)*12) + parseFloat($('#text41').val);
		var x = Number(document.getElementById('text40').value) * 12
		var y = Number(document.getElementById('text41').value)
		var val4 = x+y;
		var val5 = $('#text5').val();
		var e = document.getElementById("selector");
		var strUser = e.options[e.selectedIndex].value;
		var val6 = strUser;
		var k = document.getElementById("keto")
		var val7 = k.options[k.selectedIndex].value;
		var v = document.getElementById("vegan")
		var val8 = v.options[v.selectedIndex].value;
		//var selecting = document.getElementById('selector');
		//document.getElementById("extend").innerHTML = selecting;
		//var val2 = $('#text2').val();
		$.ajax({
			url: 'Createacc.php',
			datatype: "json",
			data: {text1: val1, text2: val2, sex: gender, text3: val3, text4: val4, text5: val5, text6: val6, text7: val7, text8: val8},
			type: 'POST',
			success: function(data){
 				localStorage.setItem("username", val1)
 				localStorage.setItem("keto", val7);
 				localStorage.setItem("vegan", val8);
				document.location.href="Nutrients.jsp";
			}
		});
	}
	</script>
</body>
</html>
