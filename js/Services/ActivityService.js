var DooDah = window.DooDah || {}; 

DooDah.Services = DooDah.Services || {}; 

DooDah.Services.ActivityService = (function (dd, $)
{

	var _getActivitiesUrl = null; 
	var _getActivitiesForMoodUrl = null; 
	
	var SetUrls = function (urls)
	{
		_getActivitiesUrl = urls.GetActivitiesUrl;
		_getActivitiesForMoodUrl = urls.GetActivitiesForMoodUrl; 
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


	var GetActivitiesForMood = function (moodVal)
	{
		return $.ajax({
			type: "GET",
			url: _getActivitiesForMoodUrl, 
			data: { Mood: moodVal }, 
			async: true, 
			accept: "application/json",
			dataType: "json"
		}); 
	}

	return {
		SetUrls: SetUrls,
		GetActivities: GetActivities, 
		GetActivitiesForMood: GetActivitiesForMood
	}; 

})(DooDah, jQuery);  