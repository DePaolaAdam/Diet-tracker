<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="app/Diethelp.js"></script>
<title>Diet tracker</title>
<style>

* {
	text-align: center;
	box-sizing: border-box;
}

body {
	font: 16px Arial;  
}

/*the container must be positioned relative:*/
.autocomplete {
	position: relative;
	display: inline-block;
}

input {
		border: 1px solid transparent;
		/*width: 50%;*/
		padding: 10px;
		font-size: 16px;
		/*border-radius: 10px;*/
		background-color: #f1f1f1;
}

input[type=text] {
	background-color: #f1f1f1;
	width: 100%;
	/* padding: 10px; */
}
input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

#button {
	background-color: DodgerBlue;
	color: #fff;
	cursor: pointer;
	width: 25%;
}
#remove {
	width: 25%;
	color: white;
	background-color: red;
	cursor: pointer;
}
#getuser {
	width: 25%;
	color: white;
	background-color: green;
	cursor: pointer;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
	padding: 10px;
	cursor: pointer;
	background-color: #fff; 
	border-bottom: 1px solid #d4d4d4; 
}
.autocomplete-items div:hover {
	background-color: #e9e9e9; 
}

.autocomplete-active {
	background-color: DodgerBlue !important; 
	color: #ffffff; 
}
#demo{
	border-collapse: collapse;
	margin-left: auto;
	margin-right:auto;
}
td, tr{
	border: 1px solid black;
	width: 100px;
	background-color: white;
	
}
#containNutrients, #containNutrientss
{
	margin-left: auto;
	margin-right:auto;
	width: 25%;
	background-color: #f1f1f1;
	border-radius: 5px;
}
h1
{
	color: white;
}
p
{
	color: white;
}
img
{
	width: 25%;
}
.removecomplete
{
	text-align: center;
}
</style>
</head>
<body onload = recommend() background = "light-blue-background-3.jpg">
<h1>Adam's Diet Tracker</h1>
<!--  
<div class = autocomplete style = "width: 300px;">
<input type="text" id="myInput" placeholder = "Add a food item">
<button id="button">Add food</button>
</div>
-->
  <div class="autocomplete" style="width:300px;">
    <input id="myInput" type="text" name="myCountry" placeholder="Add a food item">

  </div>
    <button id = "button">Add Food</button>
    <p></p>



<div class = "autocomplete" style = "width:300px;">
<input type = "text" id="text2" placeholder = "Remove a food item">

</div>
<button id="remove">remove</button>
<div id="test"></div>
<table id = "demo">
<thead>
<tr>
	<td>
	Food
	</td>
	<td>
	Calories
	</td>
	<td>
	Protein
	</td>
	<td>
	Carbs
	</td>
	<td>
	Fats
	</td>
	<td>
	Sodium
	</td>
</tr>
</thead>
</table>
<p id="gender">Add the foods you eat throughout the day to the table.</p>
<p>When you're done, press submit to get feedback on your daily diet.</p>
<button id="getuser">Submit</button>
<div id = "containNutrients">
<div id="result">Calories: 0</div>
<div id="protein">Protein: 0</div>
<div id="carbs">Carbs: 0</div>
<div id="fat">Fats: 0</div>
<div id="sodium">Sodium: 0</div>
</div>
<p></p>
<!-- <p onload="recommend()"></p> -->
<p>Your recommended daily nutrients:</p>
<div id = "containNutrientss">
<div id="results">Recommended Calories: </div>
<div id="proteins">Protein: </div>
<div id="carbss">Carbs: </div>
<div id="fats">Fats: </div>
<div id="sodiums">Sodium: </div>
</div>
<!-- <script type="text/javascript"> -->
<script>
var weight = 0;
var calories = 0;
var protein = 0;
var carbs = 0;
var fats = 0;
var sodium = 0;
var cholesterol = 0;
var c = 0;
var potassium = 0;
var gender = "";
var weight = 0;
var height = 0;
var age = 0;
var goal = "";
var NutrientName = localStorage.getItem('username');
var foodSuggestions = ["chicken-breast-100g", "chicken-thigh-100g", "chicken-wing-100g", "chicken-liver-100g", "chicken-drumsticks-100g", "chicken-tenderloin-100g", "chicken-fingers-100g", "steak-100g", "ground-beef-100g","beef-brisket-100g","potato-100g","cheese-cheddar-1-slice","cheese-mozzarella-1-slice","cheese-american-1-slice","cheese-provolone-1-slice","cheese-gouda-1-slice","cheese-pepperjack-1-slice","cheese-cottage-100g","cheese-swiss-1-slice","cheese-parmesan-1oz","cheese-feta-1oz","cheese-gorgonzola-1oz","cheese-cream-1oz","butter-1tbsp","yogurt-breyers-8oz","yogurt-breyers-8oz","yogurt-greek-100g","yogurt-frozen-100g","ice-cream-0.5cup","egg-50g","sugar-1-cube-2g","sugar-100g","milk-1%fat-1cup","milk-2%fat-1cup","milk-whole-1cup","bread-white-1-slice","bread-whole-wheat-1-slice","bread-rye-1-slice","bread-sourdough-1-slice","bread-ciabatta-30g","bread-pumpernickel-1-slice","bread-brown-1-slice","honey-1tbsp","lemon-1fruit","apple-1-small-fruit","apple-1-medium-fruit","apple-1-large-fruit","rice-white-100g","rice-brown-100g","chocolate-30g","cake-angelfood-1-slice-50g","cake-cheesecake-1-slice-80g","pancake-40g","cake-chocolate-1-slice-80g","cake-sponge-1-slice-63g","cake-fruit-1piece-43g","cake-pound-1-slice-30g","avocado-whole-200g", "avocado-50g", "peanuts-1oz", "coconut-14g", "orange-1fruit-131g", "grapefruit-1fruit-131g", "grape-100g", "banana-1fruit-118g", "strawberry-100g", "pineapple-100g", "blueberry-100g", "wine-red-5floz", "wine-white-5floz", "mango-100g", "raisin-1oz", "cherry-100g", "kiwi-100g", "peach-100g", "pear-100g", "pomegranate-100g", "carrot-100g", "cauliflower-100g", "lettuce-100g", "zucchini-100g", "asparagus-100g", "artichoke-100g", "chickpea-12.5g", "green-bean-100g", "scallion-100g", "lentil-100g", "kale-100g", "cabbage-100g", "black-bean-1cup", "pinto-bean-1cup", "kidney-bean-100g", "soy-bean-100g", "pea-100g", "navy-bean-100g", "onion-yellow-100g", "onion-red-100g", "onion-white-100g", "broccoli-100g", "spinach-100g", "mushroom-100g", "cucumber-100g", "ranch-dressing-30g", "mayonnaise-1tbsp","ketchup-1tbsp", "tomato-1cup", "mustard-1tsp", "vinegar-1tbsp", "meatloaf-100g", "ketchup-1tbsp", "ginger-11g", "garlic-11g", "bacon-slice-8g", "pork-ribs-1oz","pork-chop-100g", "pork-loin-100g", "pork-tenderloin-100g", "pork-belly-100g", "ham-100g", "turkey-breast-100g", "turkey-leg-100g", "turkey-dark-100g", "duck-100g", "tilapia-100g","cod-100g", "mackerel-100g", "tuna-100g", "salmon-100g", "hamburger-fast-food-86g", "chicken-nugget-fast-food-6pcs","chicken-sandwich-fast-food-200g","fried-chicken-100g","fried-chicken-fast-food-100g","buttermilk-100g","sour-cream-1tbsp","jalapeno-100g","cornmeal-100g","sweetcorn-100g", "pasta-100g", "marinara-sauce-100g", "salt-0.4g"];
var veganSuggestions = ["potato-100g", "sugar-1-cube-2g", "sugar-100g", "bread-white-1-slice", "bread-whole-wheat-1-slice", "bread-rye-1-slice", "bread-sourdough-1-slice", "bread-ciabatta-30g", "bread-pumpernickel-1-slice", "bread-brown-1-slice", "honey-1tbsp", "lemon-1fruit", "apple-1-small-fruit", "apple-1-medium-fruit", "apple-1-large-fruit", "rice-white-100g", "rice-brown-100g", "chocolate-30g", "cake-angelfood-1/12-slice-50g", "pancake-40g", "avocado-whole-200g", "avocado-50g", "peanuts-1oz", "coconut-14g", "orange-1fruit-131g", "grapefruit-1fruit-131g", "grape-100g", "banana-1fruit-118g", "strawberry-100g", "pineapple-100g", "blueberry-100g", "wine-red-5floz", "wine-white-5floz", "mango-100g", "raisin-1oz", "cherry-100g", "kiwi-100g", "peach-100g", "pear-100g", "pomegranate-100g", "carrot-100g", "cauliflower-100g", "lettuce-100g", "zucchini-100g", "asparagus-100g", "artichoke-100g", "chickpea-12.5g", "green-bean-100g", "scallion-100g", "lentil-100g", "kale-100g", "cabbage-100g", "black-bean-1cup", "pinto-bean-1cup", "kidney-bean-100g", "soy-bean-100g", "pea-100g", "navy-bean-100g", "onion-yellow-100g", "onion-red-100g", "onion-white-100g", "broccoli-100g", "spinach-100g", "cucumber-100g", "mayonnaise-1tbsp", "ketchup-1tbsp", "tomato-1cup", "mustard-1tsp", "vinegar-1tbsp", "ginger-11g", "garlic-11g", "jalapeno-100g", "cornmeal-100g", "sweetcorn-100g", "pasta-100g", "marinara-sauce-100g", "salt-0.4g"];
var foodRemoval = [];
var foodCount = 0;
var ketoName = localStorage.getItem("keto");
var veganName = localStorage.getItem("vegan");
function recommend(){
	var recCalories = 2000;
	var recProtein = 0;
	var recCarbs = 0;
	var recFats = 0;
	var recSodium = 2000;
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

		 
	
	if((gender == "male"))
	{
		recCalories = 2000;
		
	}
	else{
		recCalories = 1500;
	}
	recCalories += (weight * 2.5);
	if(goal == "lose")
	{
		recCalories -= 500;
	}
	else if(goal == "gain")
	{
		recCalories += 500;
	}
	if(ketoName == "yes")
	{
		recProtein = weight * 0.8;
		recFats = recCalories * 0.07;
		recCarbs = 25;
	}
	else
	{
		recProtein = weight * 0.36;
		recFats = recCalories * 0.03; 
		recCarbs = recCalories * 0.135;
	}
	document.getElementById("results").innerHTML += recCalories;
	document.getElementById("proteins").innerHTML += recProtein;
	document.getElementById("carbss").innerHTML += recCarbs;
	document.getElementById("fats").innerHTML += recFats | 0;
	document.getElementById("sodiums").innerHTML += recSodium;
		 }
	 });
}
$('#button').click(function(){
var val1 = $('#myInput').val();
var count = 0;

//document.getElementById("test").innerHTML = veganName;
$.ajax({
url: 'Puller.php',
datatype: "json",
data: {text1: val1},
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

calories = +calories + +response.calories;
protein = +protein + +response.protein;
carbs = +carbs + +response.carbs;
fats = +fats + +response.fat;
sodium = +sodium + +response.sodium;
cholesterol = +cholesterol + +response.cholesterol;
c = +c + +response.c;
potassium = +potassium + +response.potassium;

document.getElementById("result").innerHTML = "Calories: " + calories;
document.getElementById("protein").innerHTML = "Protein: " + protein;
document.getElementById("fat").innerHTML = "Fats: " + fats;
document.getElementById("carbs").innerHTML = "Carbs: " + carbs;
document.getElementById("sodium").innerHTML ="Sodium: " + sodium;
//document.getElementById("demo").innerHTML = response.food;
foodRemoval.push(val1);
var addedFood = document.createElement('tr');
addedFood.textContent = val1;
foodCount += 1;
var parent = document.getElementById("demo");
addedFood.setAttribute('id', val1 + foodCount);
addedFood.setAttribute("class", val1);
parent.appendChild(addedFood);

var calorieCol = document.createElement('td');
calorieCol.textContent = response.calories;
var calorieParent = document.getElementById(val1 + foodCount);
calorieParent.appendChild(calorieCol);

var proteinCol = document.createElement('td');
proteinCol.textContent = response.protein;
var proteinParent = document.getElementById(val1 + foodCount);
proteinParent.appendChild(proteinCol);

var carbsCol = document.createElement('td');
carbsCol.textContent = response.carbs;
var carbsParent = document.getElementById(val1 + foodCount);
carbsParent.appendChild(carbsCol);

var fatsCol = document.createElement('td');
fatsCol.textContent = response.fat;
var fatsParent = document.getElementById(val1 + foodCount);
fatsParent.appendChild(fatsCol);

var sodiumCol = document.createElement('td');
sodiumCol.textContent = response.sodium;
var sodiumParent = document.getElementById(val1 + foodCount);
sodiumParent.appendChild(sodiumCol);
}
});

});
$('#remove').click(function(){
var removeFood = $('#text2').val();
var removalFound = false;
for(let i = 0; i < foodRemoval.length; i++)
{
	if(foodRemoval[i] == removeFood)
	{
		foodRemoval.splice(i, 1);
		i = foodRemoval.length + 1;
		removalFound = true;
	}
}
//document.getElementById("demo").innerHTML = removeFood;
//var elem = document.getElementsByClassName("wapo");
//elem.parentNode.removeChild(elem);
//$(".wapo").parent().removeClass("wapo");

$("." + removeFood).first().remove();

var tester = "." + removeFood;
$.ajax({
url: 'Puller.php',
datatype: "json",
data: {text1: removeFood},
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
if(removalFound)
{
calories = +calories - +response.calories;
protein = +protein - +response.protein;
carbs = +carbs - +response.carbs;
fats = +fats - +response.fat;
sodium = +sodium - +response.sodium;
cholesterol = +cholesterol - +response.cholesterol;
c = +c - +response.c;
potassium = +potassium - +response.potassium;

document.getElementById("result").innerHTML = "Calories: " + calories;
document.getElementById("protein").innerHTML = "Protein: " + protein;
document.getElementById("fat").innerHTML = "Fats: " + fats;
document.getElementById("carbs").innerHTML = "Carbs: " + carbs;
document.getElementById("sodium").innerHTML ="Sodium: " + sodium;
}
}
});
});
$('#getuser').click(function(){

localStorage.setItem("userCalories", calories)
localStorage.setItem("userProtein", protein)
localStorage.setItem("userCarbs", carbs)
localStorage.setItem("userFats", fats)
localStorage.setItem("userSodium", sodium)
localStorage.setItem("userCholesterol", cholesterol)
localStorage.setItem("userC", c)
localStorage.setItem("userPotassium", potassium)
document.location.href="results.jsp";
//document.getElementById("demo").innerHTML = getValue;
/* $.ajax({
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

document.getElementById("gender").innerHTML = gender;
document.getElementById("result").innerHTML = weight;
document.getElementById("demo").innerHTML = goal;
}
});*/
});
function autocomplete(inp, arr) {
	  /*the autocomplete function takes two arguments,
	  the text field element and an array of possible autocompleted values:*/
	  var currentFocus;
	  /*execute a function when someone writes in the text field:*/
	  inp.addEventListener("input", function(e) {
	      var a, b, i, val = this.value;
	      /*close any already open lists of autocompleted values*/
	      closeAllLists();
	      if (!val) { return false;}
	      currentFocus = -1;
	      /*create a DIV element that will contain the items (values):*/
	      a = document.createElement("DIV");
	      a.setAttribute("id", this.id + "autocomplete-list");
	      a.setAttribute("class", "autocomplete-items");
	      /*append the DIV element as a child of the autocomplete container:*/
	      this.parentNode.appendChild(a);
	      /*for each item in the array...*/
	      for (i = 0; i < arr.length; i++) {
	        /*check if the item starts with the same letters as the text field value:*/
	        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
	          /*create a DIV element for each matching element:*/
	          b = document.createElement("DIV");
	          c = document.createElement("img");
	          c.src = "images/" + arr[i] + ".jpg";
	          /*make the matching letters bold:*/
	          
	          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
	          b.innerHTML += arr[i].substr(val.length);
	          /*insert a input field that will hold the current array item's value:*/
	          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
	          /*execute a function when someone clicks on the item value (DIV element):*/
	          b.addEventListener("click", function(e) {
	              /*insert the value for the autocomplete text field:*/
	              inp.value = this.getElementsByTagName("input")[0].value;
	              /*close the list of autocompleted values,
	              (or any other open lists of autocompleted values:*/
	              closeAllLists();
	          });
	          //a.setAttribute("class", "eleA");
	          //d = document.getElementById("buttonDiv");
	          //d.value += b;
	          a.appendChild(b);
	          b.appendChild(c);
	        }
	      }
	  });
	  /*execute a function presses a key on the keyboard:*/
	  inp.addEventListener("keydown", function(e) {
	      var x = document.getElementById(this.id + "autocomplete-list");
	      if (x) x = x.getElementsByTagName("div");
	      if (e.keyCode == 40) {
	        /*If the arrow DOWN key is pressed,
	        increase the currentFocus variable:*/
	        currentFocus++;
	        /*and and make the current item more visible:*/
	        addActive(x);
	      } else if (e.keyCode == 38) { //up
	        /*If the arrow UP key is pressed,
	        decrease the currentFocus variable:*/
	        currentFocus--;
	        /*and and make the current item more visible:*/
	        addActive(x);
	      } else if (e.keyCode == 13) {
	        /*If the ENTER key is pressed, prevent the form from being submitted,*/
	        e.preventDefault();
	        if (currentFocus > -1) {
	          /*and simulate a click on the "active" item:*/
	          if (x) x[currentFocus].click();
	        }
	      }
	  });
	  function addActive(x) {
	    /*a function to classify an item as "active":*/
	    if (!x) return false;
	    /*start by removing the "active" class on all items:*/
	    removeActive(x);
	    if (currentFocus >= x.length) currentFocus = 0;
	    if (currentFocus < 0) currentFocus = (x.length - 1);
	    /*add class "autocomplete-active":*/
	    x[currentFocus].classList.add("autocomplete-active");
	  }
	  function removeActive(x) {
	    /*a function to remove the "active" class from all autocomplete items:*/
	    for (var i = 0; i < x.length; i++) {
	      x[i].classList.remove("autocomplete-active");
	    }
	  }
	  function closeAllLists(elmnt) {
	    /*close all autocomplete lists in the document,
	    except the one passed as an argument:*/
	    var x = document.getElementsByClassName("autocomplete-items");
	    for (var i = 0; i < x.length; i++) {
	      if (elmnt != x[i] && elmnt != inp) {
	        x[i].parentNode.removeChild(x[i]);
	      }
	    }
	  }
	  /*execute a function when someone clicks in the document:*/
	  document.addEventListener("click", function (e) {
	      closeAllLists(e.target);
	  });
	}
	if (veganName == 'yep')
	{
		autocomplete(document.getElementById("myInput"), veganSuggestions);
	}
	else{
		autocomplete(document.getElementById("myInput"), foodSuggestions);
	}

</script>
</body>
</html>
