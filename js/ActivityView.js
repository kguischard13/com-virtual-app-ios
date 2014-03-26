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
	}
	
	ctrlActivitySummaryView.ActivitySummaryViewControl("Value", data);
	
/*	var data1 = {
		ActivityName: "Grab a cold one",
		LocationInfo: "<p>Bob's Bar</p><p>New Rochelle, NY</p>",
		ImagePath: "./img/sample-images/180px-Belgian_beer_glass.jpg",
		PriceStars: 4, 
		Distance: "2 mi"
	}
	
	var ctrlActivitySummaryView1 = $("#ctrlActivitySummaryView1"); 
	ctrlActivitySummaryView1.ActivitySummaryViewControl({});
	
	ctrlActivitySummaryView1.ActivitySummaryViewControl("Value", data1);*/

}); 