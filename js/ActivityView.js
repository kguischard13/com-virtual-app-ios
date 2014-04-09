$(document).ready(function () 
{	
	var pnlFilterControl = $("#pnlFilterControl"); 
	pnlFilterControl.FilterControl({}); 
	
	
	var ctrlActivitySummaryView = $("#ctrlActivitySummaryView"); 
	ctrlActivitySummaryView.ActivitySummaryViewControl({}); 
	
	var data = {
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


}); 