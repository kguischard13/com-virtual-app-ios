var EmotionApp = window.EmotionApp || {}; 

(function ($, EmotionApp, undefined)
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
        	PriceFilterText: "Price",
        	DistanceFilterText: "Distance"
        }

        //  ------------------------------------------------------------------------------------------------
        // Instance (global) variables.
        //  ------------------------------------------------------------------------------------------------
 
        var _foo = options.Foo;

        //  ------------------------------------------------------------------------------------------------
        // UI elements.
        //  ------------------------------------------------------------------------------------------------        
        var pnlContainer = null;
        var pnlSortBy = null; 
        var pnlPrice = null;
        var pnlDistance = null; 
        
        //  ------------------------------------------------------------------------------------------------
        // Initialization code.
        //  ------------------------------------------------------------------------------------------------
        var Init = function ()
        {
            /// <summary>Initialize the widget's DOM elements.</summary>
			elm.addClass("emotion-filter-control"); 
			
            pnlContainer = $("<div />")
                .addClass("pnl-container")
                .appendTo(elm);
                
            pnlSortBy = $("<div />")
            	.addClass("pnl-sort-by filter-label")
            	.text(_strings.SortByText)
            	.appendTo(pnlContainer); 
                
            pnlPrice = $("<div />")
            	.addClass("pnl-price filter-label")
            	.text(_strings.PriceFilterText)
            	.prop("tag", FilterType.Price)
            	.click(filter_click)
            	.appendTo(pnlContainer); 
            	               
            pnlDistance = $("<div />")
            	.addClass("pnl-distance filter-label")
            	.text(_strings.DistanceFilterText)
            	.prop("tag", FilterType.Distance)
            	.click(filter_click)
            	.appendTo(pnlContainer);   	
            	
            SetupFilterArrows();   	
        };

		var SetupFilterArrows = function ()
		{
			pnlPrice.addClass("descending"); 
			pnlDistance.addClass("descending");
		}
		
		var filter_click = function (e)
		{
			var tag = e.target.tag;
			
			if(tag === FilterType.Price)
			{
				if(pnlPrice.hasClass("descending"))
				{
					pnlPrice.removeClass("descending"); 
					pnlPrice.addClass("ascending"); 
				}
				else
				{
					pnlPrice.removeClass("ascending"); 
					pnlPrice.addClass("descending"); 
				}
			}
			else
			{
				if(pnlDistance.hasClass("descending"))
				{
					pnlDistance.removeClass("descending"); 
					pnlDistance.addClass("ascending"); 
				}
				else
				{
					pnlDistance.removeClass("ascending"); 
					pnlDistance.addClass("descending"); 
				}
			}
		}
		
        var txtFoo_click = function (evt)
        {
            alert("Click");
        };

        var Value = function ()
        {
            /// <summary>Gets the selected media outlet.</summary>

            var value = null;

            if (txtFoo != null)
            {
                value = txtFoo.val();
            }

            return value;
        };
        
        var Clear = function ()
        {
            // Put the widget into some neutral state.
        };

        //  ------------------------------------------------------------------------------------------------
        // Public methods
        //  ------------------------------------------------------------------------------------------------
        self.Value = Value;
        self.Clear = Clear;
        
        Init();
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
    $.widget("EmotionApp.FilterControl", {
        options: _options,
        _create: create,
        destroy: destroy
    });
})(jQuery, EmotionApp);