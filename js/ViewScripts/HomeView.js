$(document).ready(function(){
	
	// image strip and elements on the home screen
	var imageStrip = $('#image-strip'); 
	
	var image1 = $('<img id="img-1"/>')
		.attr("src", "./img/sample-images/640x480_Hike.jpg")
		.addClass("home-image-display"); 
	
	var image2 = $('<img id="img-2"/>')
		.attr("src", "./img/sample-images/USA-NYC-Staten_Island_Ferry.JPG")
		.addClass("home-image-display"); 
	
	var image3 = $('<img id="img-3"/>')
		.attr("src", "./img/sample-images/576px-MoMa_NY_USA_1.jpg")
		.addClass("home-image-display"); 
	
	var image4 = $('<img id="img-4"/>')
		.attr("src", "./img/sample-images/Golf_course,_Italy_-_20070620.jpg")
		.addClass("home-image-display");  
	
	var pnlImage1 = $('<div id="pnl-image-one" />')
		.addClass("pnl-image-container")
		.append(image1); 
	
	var pnlImage2 = $('<div id="pnl-image-two"/>')
		.addClass("pnl-image-container")
		.append(image2); 
	
	var pnlImage3 = $('<div id="pnl-image-three"/>')
		.addClass("pnl-image-container")
		.append(image3); 
	
	var pnlImage4 = $('<div id="pnl-image-four"/>')
		.addClass("pnl-image-container")
		.append(image4); 

	
	imageStrip.append(pnlImage1, pnlImage2, pnlImage3, pnlImage4); 
	
	var registrationControl = $('#registrationControl'); 
	
	registrationControl.RegistrationControl({
		DataManager: DooDah.Services.LoginService,
		IsLoginControl: true,
		LinkRegistration: "./RegistrationView.php"
	}); 
		
}); 