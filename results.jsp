<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="app/Diethelp.js"></script>
<title>Results</title>
<style>
body, html{
height: 100%;
background-position: center;
background-repeat: no-repeat;
background-size: cover;
text-align: center;
}
div
{
background-color: white;
border: 1px solid transparent;
border-radius: 5px;
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
</style>
</head>
<body background = "light-blue-background-3.jpg">
<h1>Results</h1>
<p>Calorie feedback:</p>
<div>
<p id = "output">Loading...</p>
</div>
<p>Protein feedback:</p>
<div>
<p id = "proteinOutput"></p>
</div>
<p>Carbohydrates feedback:</p>
<div>
<p id = "carbsOutput"></p>
</div>
<p>Fats feedback:</p>
<div>
<p id = "fatsOutput"></p>
</div>
<p>Sodium feedback:</p>
<div>
<p id = "sodiumOutput"></p>
</div>
<button id="account">Return</button>
<script type="text/javascript">
$(document).ready(function() {
	var recommendedCalories = 0;
	var NutrientName = localStorage.getItem('username');
	var rCalories = localStorage.getItem('userCalories');
	var rProtein = localStorage.getItem('userProtein');
	var rCarbs = localStorage.getItem('userCarbs');
	var rFats = localStorage.getItem('userFats');
	var rSodium = localStorage.getItem('userSodium');
	var rCholesterol = localStorage.getItem('userCholesterol');
	var rC = localStorage.getItem('userC');
	var rPotassium = localStorage.getItem('userPotassium');
	var keto = false;
	$.ajax({
		url: 'userinfo.php',
		datatype: "json",
		data: {text1: NutrientName},
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

		gender = response.gender;
		weight = response.weight;
		height = response.height;
		age = response.age;
		goal = response.goal;

 		if(gender == "male")
		{
			if(age > 16 || weight > 160)
			{
				if(goal == "gain")
				{
					recommendedCalories = 3000;
				}
				else if(goal = "maintain")
				{
					recommendedCalories = 2500;
				}
				else if(goal == "lose")
				{
					recommendedCalories = 2000;
				}
			}
			else if(age > 12 || weight > 100)
			{
				if(goal == "gain")
				{
					recommendedCalories = 2500;
				}
				else if(goal == "maintain")
				{
					recommendedCalories = 2000;
				}
				else if(goal == "lose")
				{
					recommendedCalories = 1500;
				}
			}
			else
			{
				recommendedCalories = 1500;
			}
		}
		else if(gender == "female")
		{
			if(age > 16 || weight > 120)
			{
				if(goal == "gain")
				{
					recommendedCalories = 2500;
				}
				else if(goal == "maintain")
				{
					recommendedCalories = 2000;
				}
				else if(goal == "lose")
				{
					recommendedCalories = 1500;
				}
			}
			else if(age > 12 || weight > 80)
			{
				if(goal == "gain")
				{
					recommendedCalories = 2000;
				}
				else if(goal == "maintain")
				{
					recommendedCalories = 1500;
				}
				else if(goal == "lose")
				{
					recommendedCalories = 1000;
				}
			}
			else
			{
				recommendedCalories = 1000;
			}
		}
		//document.getElementById("output").innerHTML = recommendedCalories;
 		var calorieIntake = rCalories - recommendedCalories;
		var burnCalories = calorieIntake - 100;
		if (calorieIntake > 300)
		{
			if(goal == "gain")
			{
				document.getElementById("output").innerHTML = "Through your daily physical activities, you should burn " + burnCalories + " calories or else you're likely to put on excess fat";
			}
			else
			{
			document.getElementById("output").innerHTML = "You'll gain more weight than you'd like on this diet, consider lowering your calorie count for the day.";
			}
		}
		else if(calorieIntake < -300)
		{
			if(goal == "lose")
			{	
				document.getElementById("output").innerHTML = "Although you're trying to lose weight, eating too little will have the opposite effect. Your body will go into survival mode, holding onto as much fat as possible and lowering your energy levels and quality of life. Have a cheat day and eat as much as you'd like to remind your body to burn fat again, then eat a daily 500 calories below your recommended daily values.";
			}
			else
			{
				document.getElementById("output").innerHTML = "You'll lose more weight than you'd like on this diet, consider upping your calorie count.";
			}
		}
		else
		{
			document.getElementById("output").innerHTML = "Your calorie count seems to be just right, keep it up!";
		}
 		var proteinIntake = weight * 0.36;
		var proteinVarianceUp = proteinIntake * 3;
		var proteinVarianceDown = proteinIntake * 0.8;
		if (rProtein > proteinVarianceUp)
		{
			document.getElementById("proteinOutput").innerHTML = "While protein consumption is important, you are eating over three times the daily recommended amount, extremely high protein diets have not been proven to cause specific adverse health effects, many professionals agree that there is a correlation between high cholesterol, heart disease, cancer, and kidney disease with excessive protein intake. You should enjoy your red meats, but if most of your protein comes from red meat then you should limit your consumption of it.";
		}
		else if(rProtein < proteinVarianceDown)
		{
			document.getElementById("proteinOutput").innerHTML = "You are getting 20% less protein than your daily recommended amount, consider fitting more protein in your diet in the form of chicken, beans, tofu, beef, pork, and many more options.";
		}
 		var carbsRecommended = recommendedCalories * 0.14;
		var carbsVarianceUp = carbsRecommended * 1.5;
		var carbsVarianceDown = carbsRecommended * 0.7;
		var carbsVarianceKeto = carbsRecommended * 0.15;
		if(carbsVarianceKeto > rCarbs)
		{
			keto = true;
			document.getElementById("carbsOutput").innerHTML = "You're eating just enough carbohydrates for a ketogenic diet, around 10% or less of your daily nutrients come from carbohydrates. If you're not going for ketogenic, you should seriously raise your carb count or you'll notice your energy levels going down significantly."
		}
		else if (carbsVarianceDown > rCarbs)
		{
			document.getElementById("carbsOutput").innerHTML = "You're under 30% of the daily recommended carbohydrates, this won't affect your weight but you may find yourself to be lethargic and low on energy. if you are on the ketogenic diet, you are eating far too many carbs. Lower this number to 20 grams of carbs if you are doing keto.";
		}
		else if(carbsVarianceUp < rCarbs)
		{
			document.getElementById("carbsOutput").innerHTML = "You are over 50% of the daily recommended carbohydrates, if you are burning this percentage of excess calories through your daily activities, you are fine. Otherwise, you are either eating too many calories or not getting enough protein or fats.";
		}
		else
		{
			document.getElementById("carbsOutput").innerHTML = "You are getting a good amount of carbs, keep it up!"
		}
		
		var fatsRecommended = recommendedCalories * .030;
		var fatsVarianceUp = fatsRecommended * 1.5;
		var fatsVarianceDown = fatsRecommended * 0.4;
		var fatsVarianceKeto = fatsRecommended * 1.9;
		if(fatsVarianceKeto < rFats)
		{
			document.getElementById("fatsOutput").innerHTML = "You are getting over twice your daily recommended amount of fats. This is actually perfect if you're on a keto diet, if your carbs are under " + carbsVarianceKeto + " then you're doing good on a ketogenic diet.";
		}
		else if(fatsVarianceUp < rFats)
		{
			document.getElementById("fatsOutput").innerHTML = "You are getting over 50% of your recommended daily fats. Even too many healthy fats can lead to heart disease and high cholesterol. If you're on the ketogenic diet, you aren't getting enough fats to trigger ketolysis. Eat more fats and you'll burn fats instead of carbs as your energy source.";
		}
		else if(fatsVarianceDown > rFats)
		{
			document.getElementById("fatsOutput").innerHTML = "You aren't getting enough fats in your diet. Without fats, you'll feel constantly hungry and tired with a weakened immune system. Most of your hormones rely on the fats you eat, so make sure to get more in your diet.";
		}
		else
		{
			document.getElementById("fatsOutput").innerHTML = "You are doing good on fats, keep it up!";
		}
		
		var sodiumRecommended = 1500;
		var sodiumVarianceUp = 2300;
		var sodiumVarianceDown = 500;
		if(sodiumVarianceUp < rSodium)
		{
			document.getElementById("sodiumOutput").innerHTML = "You are getting too much sodium. The American Heart Association recommends no more than 2300 milligrams of sodium a day, while most Americans get over 3400mg a day. If you do a lot of physical activity, you can sweat out alot of sodium and intake a bit more. You likely know about the heart risks and high blood pressure associated with high sodium. Just lower your processed food and salt intake.";
		}
		else if(sodiumVarianceDown > rSodium)
		{
			document.getElementById("sodiumOutput").innerHTML = "You are getting under 500mg of sodium a day. This is pretty rare, but it correlates with weight gain, high cholesterol, and increased blood pressure. A fourth of a teaspoon of salt will have 500mg, so eat some seasoned food and you'll be fine.";
		}
		else
		{
			document.getElementById("sodiumOutput").innerHTML = "You are getting a healthy amount of daily sodium. If you're American, thats actually very impressive. Great diet control!";
		}
		}
	});
})

</script>
</body>
</html>
