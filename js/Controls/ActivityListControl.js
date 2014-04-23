var DooDah = window.DooDah || {}; 

(function ($, dd)
{
    //  ------------------------------------------------------------------------------------------------
    // Options for the widget
    //  ------------------------------------------------------------------------------------------------
    
    var _options = {
        DataProvider: null,
        ImagePath: "../img/sample-images/"
    };

    //  ------------------------------------------------------------------------------------------------
    // This function is called by the jQuery widget engine to create the widget.
    //  ------------------------------------------------------------------------------------------------
    var create = function ()
    {
        var self = this;
        var elm = self.element;
        var options = self.options;
        
        var _strings = {
        	SortByText: "Sort Filters: ", 
        	PriceFilterText: "Price: ",
        	DistanceFilterText: "Distance", 
        	MoodFilterText: "Mood", 
        	LabelDoActivity: "Do it!"
        }; 

        //  ------------------------------------------------------------------------------------------------
        // Instance (global) variables.
        //  ------------------------------------------------------------------------------------------------
 
        var _foo = options.Foo;
        var _dataProvider = self.options.DataProvider != null ? self.options.DataProvider : DooDah.Services.ActivityService; 
		var _imagePath = self.options.ImagePath; 
		var _images = null; 
		
		
        //  ------------------------------------------------------------------------------------------------
        // UI elements.
        //  ------------------------------------------------------------------------------------------------        
        var pnlContainer = null;
        var pnlImageContainer = null; 
        var imgEventImage = null; 
        var pnlInfoContainer = null; 
        var pnlEventName = null; 
        var pnlLocationInfo = null; 
        var pnlDoActivity = null; 
        var chkDoActivity = null; 
        var lblDoActivity = null; 
        var pnlSnapshot = null;
        var pnlPrice = null; 
        var imgPrice = null; 
        
        //  ------------------------------------------------------------------------------------------------
        // Initialization code.
        //  ------------------------------------------------------------------------------------------------
        var Init = function ()
        {
            /// <summary>Initialize the widget's DOM elements.</summary>
			elm.addClass("emotion-activity-list-view-control"); 
			
            pnlContainer = $("<div></div>")
                .addClass("pnl-container")
                .appendTo(elm);
        };
        
        var SetValue = function (value)
        {
        	if(value.hasOwnProperty("ActivityName"))
        	{
        		pnlEventName.html(value.ActivityName);
        	}
        	
        	if(value.hasOwnProperty("LocationInfo"))
        	{
        		pnlLocationInfo.html(value.LocationInfo);         	
        	}
        	
        	if(value.hasOwnProperty("ImagePath"))
        	{
        	    imgEventImage.attr("src", value.ImagePath); 
        	}
        	
        	if(value.hasOwnProperty("PriceStars"))
        	{
        		if(value.PriceStars === 4)
        		{
        			imgPrice.attr("src", "./img/sample-images/47px-4-stars.png"); 
        		}
        	}
        	
        	if(value.hasOwnProperty("Distance"))
        	{
        		pnlDistance.html("Distance: " + value.Distance); 
        	}
        		
        };
        
        
        var LoadAsync = function ()
        {
        	if(_moodContext == null)
        	{
        		throw new Error("Mood Context is required"); 
        	}
        	
        	var provider = _dataProvider; 
        	
        	provider.GetActivitiesForMood(_moodContext)
        		.done(function (data, status) 
        		{
        			Fill(data); 
        		}); 
        }; 
        
        var Fill = function (data)
        {
        	$.each(data, function (i, item)
        	{
        		var id = item.Id; 
        		
        		var div = $('<div id=' + id + '></div>');
        		div.addClass("list-item"); 
        		var ctrlSummaryView = div.ActivitySummaryViewControl({}); 
        		ctrlSummaryView.ActivitySummaryViewControl("Value", data[i]); 
        		div.prop("tag", data[i]); 
				pnlContainer.append(div);         	
        	}); 
        }
        
        var SetMoodContext = function (mood)
        {
        	_moodContext = mood; 
        }
        
        var GetValue = function ()
        {
        	return {
        		ActivityName: pnlEventName.innerHTML,
        		LocationInfo: pnlLocationInfo.innerHTML,
        		ImagePath: imgEventImage.attr("src")
        	};
        };
        
        var Value = function (value)
        {
        	if(value === undefined)
        	{	
        		return GetValue(); 
        	}
        	else
        	{
        		SetValue(value);
        	}
        };

        var Clear = function ()
        {
            // Put the widget into some neutral state.
        };
        
        Init();
        
    	//  ------------------------------------------------------------------------------------------------
        // Public methods
        //  ------------------------------------------------------------------------------------------------
        
        self.Value = Value; 
        self.LoadAsync = LoadAsync; 
        self.SetMoodContext = SetMoodContext; 
    };

    //  ------------------------------------------------------------------------------------------------
    // This function is called by the jQuery widget engine to destroy the widget.
    //  ------------------------------------------------------------------------------------------------
    var destroy = function ()
    {
        /// <summary> Use the destroy method to clean up any modifications your widget has made to the DOM </summary>

        // clear things created by us
        this.element.children().remove();
        // invoke the destroy method from the base widget
        this.element.removeData(this.widgetName);
        $.Widget.prototype.destroy.call(this);
    };

    //  ------------------------------------------------------------------------------------------------
    // Create the jQuery widget class
    //  ------------------------------------------------------------------------------------------------
    $.widget("DooDah.ActivityListViewControl", {
        options: _options,
        _create: create,
        destroy: destroy
    });
})(jQuery, DooDah);