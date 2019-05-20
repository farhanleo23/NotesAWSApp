# Notes

<!DOCTYPE html>
<html>
<style>
#myProgress {
  width: 100%;
  background-color: #ddd;
}

#myBar {
  width: 50%;
  height: 30px;
  background-color: #4CAF50;
  text-align: center;
  line-height: 30px;
  color: white;
}
</style>
<body>


<div id="myProgress">
  <div id="myBar">50%</div>
</div>



<script>
function start(){
var elem = document.getElementById("myBar");
var width = -10;
var current = 50;
function moveLeft(){
width = -10;
current += width;
elem.style.width = current + '%'; 
      elem.innerHTML = current * 1  + '%';
      width = 0;
}

function moveRight(){
width = -10;
current += width;
elem.style.width = current + '%'; 
      elem.innerHTML = current * 1  + '%';
      width = 0;
}
function move() {
     
   width = 50;
  var id = setInterval(frame, 10);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
    } else {
      width++; 
      elem.style.width = width + '%'; 
      elem.innerHTML = width * 1  + '%';
    }
  }
}
document.addEventListener('keydown', function(event){

    if(event.keyCode == 37){//left arrow key
    moveLeft();
    }
	else if(event.keyCode == 39){
	move();
	}
	else if(event.keyCode == 38){
    move();
	}
	else if(event.keyCode == 40){
    move();
	}
	
} );}

window.onload=start;
</script>

</body>
</html>
