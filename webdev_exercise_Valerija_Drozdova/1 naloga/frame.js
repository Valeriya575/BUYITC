
function myFunction() {
	
	var j = 3000;
	
	
	document.getElementById('title1').style.display = 'inline-block';
	document.getElementById('first_p1').style.display = 'inline-block';
	document.getElementById('second_p1').style.display = 'inline-block';

	
	document.getElementById('title2').style.display = 'none';
	document.getElementById('first_p2').style.display = 'none';
	document.getElementById('second_p2').style.display = 'none';

	document.getElementById('title3').style.display = 'none';
	document.getElementById('first_p3').style.display = 'none';
	document.getElementById('second_p3').style.display = 'none';
		
	setTimeout(function() {
		
	  document.getElementById('title1').style.display = 'none';
	  document.getElementById('first_p1').style.display = 'none';
	  document.getElementById('second_p1').style.display = 'none';
	  
	  document.getElementById('title2').style.display = 'inline-block';
	  document.getElementById('first_p2').style.display = 'inline-block';
	  document.getElementById('second_p2').style.display = 'inline-block';
	  
	  document.getElementById('title3').style.display = 'none';
	  document.getElementById('first_p3').style.display = 'none';
	  document.getElementById('second_p3').style.display = 'none';
	 
	}, j);

	setTimeout(function() {
		
	  document.getElementById('title1').style.display = 'none';
	  document.getElementById('first_p1').style.display = 'none';
	  document.getElementById('second_p1').style.display = 'none';
		
	  document.getElementById('title2').style.display = 'none';
	  document.getElementById('first_p2').style.display = 'none';
	  document.getElementById('second_p2').style.display = 'none';
	  

	  document.getElementById('title3').style.display = 'inline-block';
	  document.getElementById('first_p3').style.display = 'inline-block';
	  document.getElementById('second_p3').style.display = 'inline-block';
	  
	}, 2*j);
	
}
myFunction();
setInterval(myFunction, 9000);
