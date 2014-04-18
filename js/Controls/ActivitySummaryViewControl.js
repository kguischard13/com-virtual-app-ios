var DooDah = window.DooDah || {}; 

(function ($, dd)
{
    //  ------------------------------------------------------------------------------------------------
    // Options for the widget
    //  ------------------------------------------------------------------------------------------------
    
    var _options = {
        DataProvider: null
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
        	DistanceFilterText: "Distance: ", 
        	MoodFilterText: "Mood", 
        	LabelDoActivity: "Do it!"
        }; 

        //  ------------------------------------------------------------------------------------------------
        // Instance (global) variables.
        //  ------------------------------------------------------------------------------------------------
 
        var _foo = options.Foo;

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
        var pnlDistance = null; 
        var lblDistance = null;  
        
        //  ------------------------------------------------------------------------------------------------
        // Initialization code.
        //  ------------------------------------------------------------------------------------------------
        var Init = function ()
        {
            /// <summary>Initialize the widget's DOM elements.</summary>
			elm.addClass("emotion-activity-summary-view-control"); 
			
            pnlContainer = $("<div></div>")
                .addClass("pnl-container")
                .appendTo(elm);
                
            pnlImageContainer = $("<div></div>")
            	.addClass("pnl-image-container")
            	.appendTo(pnlContainer); 
            	
            imgEventImage = $("<img></img>")
            	.addClass("main-image-display")
            	.appendTo(pnlImageContainer); 
            	                            
            pnlInfoContainer = $("<div></div>")
            	.addClass("pnl-info-container")
            	.appendTo(pnlContainer);
            	               
            pnlEventName = $("<div></div>")
            	.addClass("pnl-event-name")
            	.html("Event Name")
            	.appendTo(pnlInfoContainer); 
            	
            pnlLocationInfo = $("<div></div>")
            	.addClass("pnl-location-info")
            	.appendTo(pnlInfoContainer); 

            pnlDoActivity = $("<div></div>")
            	.addClass("pnl-do-activity")
            	.appendTo(pnlInfoContainer); 
            	
            var random = Math.floor((Math.random() * 1000) + 1); 
            var name = "checkbox_" + random; 
            	
            chkDoActivity = $("<input type='checkbox' id='" + name + "'value='true' />") 
            	.addClass("chk-do-activity")
            	.appendTo(pnlInfoContainer); 
            	
            lblDoActivity = $("<label />")
            	.addClass("lbl-do-activity")
            	.html(_strings.LabelDoActivity)
            	.prepend(chkDoActivity)
            	.appendTo(pnlDoActivity); 
            	
            pnlSnapshot = $("<div></div>")
            	.addClass("pnl-snapshot")
            	.appendTo(pnlInfoContainer);
            	
            pnlPrice = $("<div></div>")
            	.addClass("pnl-price-stars")
            	.html(_strings.PriceFilterText)
            	.appendTo(pnlSnapshot)
            	
            imgPrice = $("<img></img>")
            	.addClass("price-image-display")
            	.appendTo(pnlPrice);      
				
            pnlDistance = $("<div></div>")
            	.addClass("pnl-distance")
            	.appendTo(pnlSnapshot); 
        };
        
        var SetValue = function (value)
        {
        	chkDoActivity.prop("tag", value); 
        	pnlEventName.html(value.Name);
        	pnlLocationInfo.html('<br>' + value.VenueName + '<br>' + value.City + ', ' + value.State + " " + value.Zip); 
        	
        	/*pnlLocationInfo.html("<p>" + value.VenueName + "</p>" + "<p>" + 
        	value.City + "</p>" + "<p>" + value.State + "</p>");   */
        	pnlDistance.html("4.0 miles");
        	
        	var price = value.Cost; 
        	var src = GetPriceSource(price); 
        	
			imgPrice.attr("src", src);
			imgEventImage.attr("src", value.ImagePath); 
        };
        
        var GetPriceSource = function (cost)
        {
        	var price = cost.toLowerCase(); 
        	var src = ""; 
        	
        	if(price == "free")
        	{
        		pnlPrice.html(_strings.PriceFilterText + "Free"); 
        	}
        	else if (price == "medium")
        	{
        		src = "./img/sample-images/200px-3_stars.png"; 
        	}
        	else if (price == "low")
        	{
        		src = "./img/sample-images/200px-1_stars.png"; 
        	}
        	else if (price == "high")
        	{
        	    src = "./img/sample-images/200px-5_stars.png"; 
        	}
        	
        	return src; 
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
    $.widget("DooDah.ActivitySummaryViewControl", {
        options: _options,
        _create: create,
        destroy: destroy
    });
})(jQuery, DooDah);