({
    handleclick : function(component, event, helper) {
        //component.set("v.Text","handleClick is called");
       //helper.helperMethod(component, event, helper);
        var message =event.getParam("message");
        //var message = event.getParams("message");
        component.set("v.text",message);
        
    }           
})