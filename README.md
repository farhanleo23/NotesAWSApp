
<!DOCTYPE html>
<html>
<head>
<h1> Progress Bar</h1>
<style>
#myProgress {
  width: 100%;
  background-color: grey;
}

#myBar {
  width: 50%;
  height: 30px;
  background-color: green;
  text-align: center;
  line-height: 30px;
  color: white;
}
</style>
</head>
<body>


<div id="myProgress">
  <div id="myBar">50%</div>
</div>


<script>
function start(){
var elem = document.getElementById("myBar");
var current = 50;

function moveLeft(){
if(current>0){
current += -10;
elem.style.width = current + '%'; 
elem.innerHTML = current * 1  + '%';
  }
}

function moveRight(){
if(current<100){
current += 10;
elem.style.width = current + '%'; 
      elem.innerHTML = current * 1  + '%';
      }
}

function moveDown(){
elem.style.width = 0 + '%';
elem.innerHTML = 0  + '%';
current = 0;

}
function moveUp() {
   elem.style.width = 100 + '%';
elem.innerHTML = 100  + '%'; 
current =100;
}
document.addEventListener('keydown', function(event){
//37 left arrow
//39 right arrow
//38 up arrow
//40 down arrow
    if(event.keyCode == 37){//left arrow key
    moveLeft();
    }
	else if(event.keyCode == 39){
	moveRight();
	}
	else if(event.keyCode == 38){
    moveUp();
	}
	else if(event.keyCode == 40){
    moveDown();
	}
	
} );}

window.onload=start;
</script>

</body>
</html>

