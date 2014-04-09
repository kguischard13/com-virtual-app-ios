var DooDah = window.DooDah || {}; 

DooDah.Services = DooDah.Services || {}; 

DooDah.Services.ActivityService = (function (dd, $)
{

	var _getActivitiesUrl = null; 
	var _getActivitiesForMoodUrl = null; 
	
	var SetUrls = function (urls)
	{
		_getActivitiesUrl = urls.GetActivitiesUrl;
	}
	
	var GetActivities = function ()
	{
		return $.ajax({
			type: "GET",
			url: _getActivitiesUrl,
			async: true,
			accept: "application/json",
			dataType: "json"
		}); 
	}


	return {
		SetUrls: SetUrls,
		GetActivities: GetActivities
	}; 

})(DooDah, jQuery);  