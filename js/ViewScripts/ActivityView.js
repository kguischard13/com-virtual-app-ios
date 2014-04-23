$(document).ready(function () 
{	
	var pnlFilterControl = $("#pnlFilterControl"); 
	pnlFilterControl.FilterControl({}); 
	
	
	var ctrlActivitySummaryView = $("#ctrlActivitySummaryView"); 
	ctrlActivitySummaryView.ActivityListViewControl({}); 
	
	ctrlActivitySummaryView.ActivityListViewControl("SetMoodContext", 6); 
	ctrlActivitySummaryView.ActivityListViewControl("LoadAsync");
	
/*	var data = {
		ActivityName: "Walk in the park",
		LocationInfo: "<p>Central Park</p><p>New York, NY</p>",
		ImagePath: "./img/sample-images/CentralPark180px.jpg",
		PriceStars: 4, 
		Distance: "10 mi"
	};
	
	ctrlActivitySummaryView.ActivitySummaryViewControl("Value", data);
	
	
	var ctrlActivitySummaryView2 = $("#summaryView2"); 
	ctrlActivitySummaryView2.ActivitySummaryViewControl({}); 
	
	ctrlActivitySummaryView2.ActivitySummaryViewControl("Value", data);
	
	var btnActivities = $("#btnActivities"); 
	
	btnActivities.click(function ()
	{
		return DooDah.Services.ActivityService.GetActivitiesForMood("hack")
			.done(function (data) 
			{
				console.log(data); 
			
			})
			.fail(function (data)
			{
				alert(data.responseText); 		
			});
	}); */ 


}); 