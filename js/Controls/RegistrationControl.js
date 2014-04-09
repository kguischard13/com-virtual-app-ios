var DooDah = window.DooDah || {}; 

(function ($, dd)
{
    //  ------------------------------------------------------------------------------------------------
    // Options for the widget
    //  ------------------------------------------------------------------------------------------------
    
    var _options = {
        DataManager: null,
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
        	LabelFirstName: "First Name:",
        	LabelLastName: "Last Name:",
        	LabelEmail: "Email:",
        	LabelUserName: "Username:",
        	LabelPassword: "Password:",
        	ButtonSubmit: "Register", 
        	ButtonCancel: "Cancel"
        }; 

        //  ------------------------------------------------------------------------------------------------
        // Instance (global) variables.
        //  ------------------------------------------------------------------------------------------------
 
        var _foo = options.Foo;

        //  ------------------------------------------------------------------------------------------------
        // UI elements.
        //  ------------------------------------------------------------------------------------------------        
        var pnlContainer = null;
        var txtFirstName = null; 
        var lblFirstName = null; 
        var txtLastName = null; 
        var lblLastName = null; 
        var txtEmail = null; 
        var lblEmail = null; 
        var txtUserName = null;
        var lblUserName = null; 
        var txtPassword = null; 
        var lblPassword = null; 
        var pnlButtonContainer = null; 
        var btnSubmit = null; 
        var btnCancel = null; 
        
        //  ------------------------------------------------------------------------------------------------
        // Initialization code.
        //  ------------------------------------------------------------------------------------------------
        var Init = function ()
        {
            /// <summary>Initialize the widget's DOM elements.</summary>
			elm.addClass("emotion-registration-control"); 
			
            pnlContainer = $("<div />")
                .addClass("pnl-container")
                .appendTo(elm);
                
            txtFirstName =$("<input type='text' />")
                .addClass("reg-form-input")
                .appendTo(pnlContainer);
                
            lblFirstName = $("<label class='reg-form-label' />")
            	.addClass("reg-form-label")
            	.html(_strings.LabelFirstName)
            	.appendTo(pnlContainer)
            	.append(txtFirstName);  
            	
            txtLastName =$("<input type='text' />")
                .addClass("reg-form-input")
                .appendTo(pnlContainer);
                
            lblLastName = $("<label class='reg-form-label' />")
            	.addClass("reg-form-label")
            	.html(_strings.LabelLastName)
            	.appendTo(pnlContainer)
            	.append(txtLastName);  
            
            txtEmail =$("<input type='text' />")
                .addClass("reg-form-input")
                .appendTo(pnlContainer);
                
            lblEmail = $("<label class='reg-form-label' />")
            	.addClass("reg-form-label")
            	.html(_strings.LabelEmail)
            	.appendTo(pnlContainer)
            	.append(txtEmail);  
            	
            txtUserName =$("<input type='text' />")
                .addClass("reg-form-input")
                .appendTo(pnlContainer);
                
            lblUserName = $("<label class='reg-form-label' />")
            	.addClass("reg-form-label")
            	.html(_strings.LabelUserName)
            	.appendTo(pnlContainer)
            	.append(txtUserName);      
            	
            txtPassword =$("<input type='password' />")
                .addClass("reg-form-input")
                .appendTo(pnlContainer);
                
            lblPassword = $("<label class='reg-form-label' />")
            	.addClass("reg-form-label")
            	.html(_strings.LabelPassword)
            	.appendTo(pnlContainer)
            	.append(txtPassword);        
            	
            pnlButtonContainer = $("<div />")
            	.addClass("pnl-button-container")
            	.appendTo(pnlContainer); 	
            
            btnSubmit = $("<button id ='btnSubmit' type='button' />")
            	.addClass("btn-form")
            	.html(_strings.ButtonSubmit)
            	.appendTo(pnlButtonContainer); 
            	
            btnCancel = $("<button id='btnCancel' type='button' />")
            	.addClass("btn-form")
            	.html(_strings.ButtonCancel)
            	.appendTo(pnlButtonContainer);    	  	
        };

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
        
        Init();
        
        //  ------------------------------------------------------------------------------------------------
        // Public methods
        //  ------------------------------------------------------------------------------------------------
        
        self.Value = Value;
        self.Clear = Clear;
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
    $.widget("DooDah.RegistrationControl", {
        options: _options,
        _create: create,
        destroy: destroy
    });
})(jQuery, DooDah);