var DooDah = window.DooDah || {}; 

(function ($, DooDah){

DooDah.Services.ActivityService.SetUrls({
	GetActivitiesUrl: "GetAllActivities.php",
	GetActivitiesForMoodUrl: "GetActivitiesForMood.php"
}); 

DooDah.Service.LoginService.SetUrls({
	ValidateUserUrl: "LoginService.php"
}); 


})(jQuery, DooDah); 