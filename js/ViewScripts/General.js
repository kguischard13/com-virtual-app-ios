$(document).ready(function (){


	var login_leave = function (e)
	{	
		clearTimeout(); 
		setTimeout(function (){
				
			if(!subMenu.hasClass("visible"))
			{
				subMenu.hide(); 
			}
		
		}, 2000); 
		console.log("login leave"); 
	}

	var login_enter= function (e)
	{
		console.log("login enter"); 
		var id = e.target.id; 
	
		if(id == "account")
		{
			subMenu.show();
		}
	}; 

	var sub_enter = function ()
	{
		console.log("sub menu enter"); 
		subMenu.addClass("visible"); 
		subMenu.show(); 
	}; 

	var sub_leave = function ()
	{
		console.log("sub menu leave"); 
		subMenu.removeClass("visible"); 
		clearTimeout(); 
		setTimeout(function (){
				
			if(!subMenu.hasClass("visible"))
			{
				subMenu.hide(); 
			}
		
		}, 2000); 		
	}; 
	
	
	var loginLink = $("#account"); 
	var subMenu = $("#sub-menu").hide(); 
	
	// event binders for entering navigation menus 
	loginLink.on("mouseenter", login_enter); 
	loginLink.on("mouseleave", login_leave);
	subMenu.on("mouseenter", sub_enter); 
	subMenu.on("mouseleave", sub_leave);


}); 