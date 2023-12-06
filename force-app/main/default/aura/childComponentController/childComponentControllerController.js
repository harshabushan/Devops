({
	handleclick : function(component, event, helper) {
		var eventData =component.getEvent("sampleCmpEvent"); 
        eventData.setParams({message : "this is from child"});
        eventData.fire();
	}
})