

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Question 2</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Question 2</h2>
  <div class="progress">
    <div class="progress-bar" id="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%">
      50%
    </div>
  </div>
</div>
<script>
function start(){
document.addEventListener('keydown', function(event){
    //37 for left
	//39 for right
	// 38 is up
	// 40 is down
	if(event.keyCode == 37){
    alert("left");}
	else if(event.keyCode == 39) {
	alert("right");}
	else if(event.keyCode == 38) {
	moveUp();}
	else if(event.keyCode == 40) {
	moveDown();}
} );
}
function moveUp() {
  var elem = document.getElementById("progressbar");   
  var width = 50;
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
function moveDown() {
  var elem = document.getElementById("progressbar");   
  var width = 50;
  var id = setInterval(frame, 10);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
    } else {
      width--; 
      elem.style.width = width + '%'; 
      elem.innerHTML = width * 1  + '%';
    }
  }
}
window.onload=start;
</script>
</body>
</html>
