
$(document).on('vrub:plugin_ready:VRUB_Core_PersistentStore', function() { // Always wait for the plugin to be ready, so that VRUB.js and the plugin's JS has loaded.
	console.log("SETTINGS: VRUB Core and Persistent Store are Ready");

	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox1").then(function(StateOverlaySettings_Checkbox1) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox1: " + StateOverlaySettings_Checkbox1);	
		var StateCheckbox1 = StateOverlaySettings_Checkbox1;
		if (StateCheckbox1=="false"){ 
			var StateCheckbox1 = "";
		}	
		console.log("SET_checkbox_1: " + StateCheckbox1);
		console.log("TRUE SET_checkbox_1: " + StateCheckbox1);
		document.getElementById("IDcheckbox1").checked=StateCheckbox1;	
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox2").then(function(StateOverlaySettings_Checkbox2) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox2: " + StateOverlaySettings_Checkbox2);	
		var StateCheckbox2 = StateOverlaySettings_Checkbox2;
		if (StateCheckbox2=="false"){ 
			var StateCheckbox2 = "";
		}	
		console.log("SET_checkbox_2: " + StateCheckbox2);
		console.log("TRUE SET_checkbox_2: " + StateCheckbox2);
		document.getElementById("IDcheckbox2").checked=StateCheckbox2;	
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox3").then(function(StateOverlaySettings_Checkbox3) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox3: " + StateOverlaySettings_Checkbox3);
		var StateCheckbox3 = StateOverlaySettings_Checkbox3;
		if (StateCheckbox3=="false"){ 
			var StateCheckbox3 = "";
		}	
		console.log("SET_checkbox_3: " + StateCheckbox3);
		console.log("TRUE SET_checkbox_3: " + StateCheckbox3);
		document.getElementById("IDcheckbox3").checked=StateCheckbox3;				        			
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox4").then(function(StateOverlaySettings_Checkbox4) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox4: " + StateOverlaySettings_Checkbox4);
		var StateCheckbox4 = StateOverlaySettings_Checkbox4;
		if (StateCheckbox4=="false"){ 
			var StateCheckbox4 = "";
		}	
		console.log("SET_checkbox_4: " + StateCheckbox4);
		console.log("TRUE SET_checkbox_4: " + StateCheckbox4);
		document.getElementById("IDcheckbox4").checked=StateCheckbox4;	
						
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox5").then(function(StateOverlaySettings_Checkbox5) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox5: " + StateOverlaySettings_Checkbox5);
		var StateCheckbox5 = StateOverlaySettings_Checkbox5;
		if (StateCheckbox5=="false"){ 
			var StateCheckbox5 = "";
		}	
		console.log("SET_checkbox_5: " + StateCheckbox5);
		console.log("TRUE SET_checkbox_5: " + StateCheckbox5);
		document.getElementById("IDcheckbox5").checked=StateCheckbox5;			        		
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox6").then(function(StateOverlaySettings_Checkbox6) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox6: " + StateOverlaySettings_Checkbox6);
		var StateCheckbox6 = StateOverlaySettings_Checkbox6;
		if (StateCheckbox6=="false"){ 
			var StateCheckbox6 = "";
		}	
		console.log("SET_checkbox_6: " + StateCheckbox6);
		console.log("TRUE SET_checkbox_6: " + StateCheckbox6);
		document.getElementById("IDcheckbox6").checked=StateCheckbox6;			        		
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox7").then(function(StateOverlaySettings_Checkbox7) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox7: " + StateOverlaySettings_Checkbox7);
		var StateCheckbox7 = StateOverlaySettings_Checkbox7;
		if (StateCheckbox7=="false"){ 
			var StateCheckbox7 = "";
		}	
		console.log("SET_checkbox_7: " + StateCheckbox7);
		console.log("TRUE SET_checkbox_7: " + StateCheckbox7);
		document.getElementById("IDcheckbox7").checked=StateCheckbox7;			        		
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox8").then(function(StateOverlaySettings_Checkbox8) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox8: " + StateOverlaySettings_Checkbox8);
		var StateCheckbox8 = StateOverlaySettings_Checkbox8;
		if (StateCheckbox8=="false"){ 
			var StateCheckbox8 = "";
		}	
		console.log("SET_checkbox_8: " + StateCheckbox8);
		console.log("TRUE SET_checkbox_8: " + StateCheckbox8);
		document.getElementById("IDcheckbox8").checked=StateCheckbox8;			        		
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox9").then(function(StateOverlaySettings_Checkbox9) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox9: " + StateOverlaySettings_Checkbox9);
		var StateCheckbox9 = StateOverlaySettings_Checkbox9;
		if (StateCheckbox9=="false"){ 
			var StateCheckbox9 = "";
		}	
		console.log("SET_checkbox_9: " + StateCheckbox9);
		console.log("TRUE SET_checkbox_9: " + StateCheckbox9);
		document.getElementById("IDcheckbox9").checked=StateCheckbox9;			        		
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox10").then(function(StateOverlaySettings_Checkbox10) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox10: " + StateOverlaySettings_Checkbox10);
		var StateCheckbox10 = StateOverlaySettings_Checkbox10;
		if (StateCheckbox10=="false"){ 
			var StateCheckbox10 = "";
		}	
		console.log("SET_checkbox_10: " + StateCheckbox10);
		console.log("TRUE SET_checkbox_10: " + StateCheckbox10);
		document.getElementById("IDcheckbox10").checked=StateCheckbox10;			        		
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox11").then(function(StateOverlaySettings_Checkbox11) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox11: " + StateOverlaySettings_Checkbox11);
		var StateCheckbox11 = StateOverlaySettings_Checkbox11;
		if (StateCheckbox11=="false"){ 
			var StateCheckbox11 = "";
		}	
		console.log("SET_checkbox_11: " + StateCheckbox11);
		console.log("TRUE SET_checkbox_11: " + StateCheckbox11);
		document.getElementById("IDcheckbox11").checked=StateCheckbox11;			        		
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox12").then(function(StateOverlaySettings_Checkbox12) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox12: " + StateOverlaySettings_Checkbox12);
		var StateCheckbox12 = StateOverlaySettings_Checkbox12;
		if (StateCheckbox12=="false"){ 
			var StateCheckbox12 = "";
		}	
		console.log("SET_checkbox_12: " + StateCheckbox12);
		console.log("TRUE SET_checkbox_12: " + StateCheckbox12);
		document.getElementById("IDcheckbox12").checked=StateCheckbox12;			        		
	});
	VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox13").then(function(StateOverlaySettings_Checkbox13) {
		console.log("LoadONStart_StateOverlaySettings_Checkbox13: " + StateOverlaySettings_Checkbox13);
		var StateCheckbox13 = StateOverlaySettings_Checkbox13;
		if (StateCheckbox13=="false"){ 
			var StateCheckbox13 = "";
		}	
		console.log("SET_checkbox_13: " + StateCheckbox13);
		console.log("TRUE SET_checkbox_13: " + StateCheckbox13);
		document.getElementById("IDcheckbox13").checked=StateCheckbox13;			        		
	});
});


function Function_checkbox_1(IDcheckbox) {
    if(document.getElementById("IDcheckbox1").checked==true) 
        {
            document.getElementById("IDcheckbox1").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox1").checked=false; 
			 var StateCheckbox = "false";
        }
			
	console.log("OverlaySettings_Checkbox1: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox1", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox1").then(function(result) {
			console.log("New Checkbox1 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox1, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_2(IDcheckbox) {
    if(document.getElementById("IDcheckbox2").checked==true) 
        {
            document.getElementById("IDcheckbox2").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox2").checked=false; 
			 var StateCheckbox = "false";
        }
	
	console.log("OverlaySettings_Checkbox2: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox2", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox2").then(function(result) {
			console.log("New Checkbox2 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox2, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_3(IDcheckbox) {
    if(document.getElementById("IDcheckbox3").checked==true) 
        {
            document.getElementById("IDcheckbox3").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox3").checked=false; 
			 var StateCheckbox = "false";
        }
	
	console.log("OverlaySettings_Checkbox3: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox3", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox3").then(function(result) {
			console.log("New Checkbox3 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox3, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_4(IDcheckbox) {
    if(document.getElementById("IDcheckbox4").checked==true) 
        {
            document.getElementById("IDcheckbox4").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox4").checked=false; 
			 var StateCheckbox = "false";
        }
	
	console.log("OverlaySettings_Checkbox4: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox4", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox4").then(function(result) {
			console.log("New Checkbox4 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox4, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_5(IDcheckbox) {
    if(document.getElementById("IDcheckbox5").checked==true) 
        {
            document.getElementById("IDcheckbox5").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox5").checked=false; 
			 var StateCheckbox = "false";
        }
	
	console.log("OverlaySettings_Checkbox5: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox5", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox5").then(function(result) {
			console.log("New Checkbox5 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox5, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_6(IDcheckbox) {
	if(document.getElementById("IDcheckbox6").checked==true) 
		{
			document.getElementById("IDcheckbox6").checked=true;
			var StateCheckbox = "true";
		}
	else
		{   
			document.getElementById("IDcheckbox6").checked=false; 
			var StateCheckbox = "false";
		}
	
	console.log("OverlaySettings_Checkbox6: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox6", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox6").then(function(result) {
			console.log("New Checkbox6 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox6, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_7(IDcheckbox) {
    if(document.getElementById("IDcheckbox7").checked==true) 
        {
            document.getElementById("IDcheckbox7").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox7").checked=false; 
			 var StateCheckbox = "false";
        }
			
	console.log("OverlaySettings_Checkbox7: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox7", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox7").then(function(result) {
			console.log("New Checkbox7 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox7, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_8(IDcheckbox) {
    if(document.getElementById("IDcheckbox8").checked==true) 
        {
            document.getElementById("IDcheckbox8").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox8").checked=false; 
			 var StateCheckbox = "false";
        }
	
	console.log("OverlaySettings_Checkbox8: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox8", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox8").then(function(result) {
			console.log("New Checkbox8 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox8, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_9(IDcheckbox) {
    if(document.getElementById("IDcheckbox9").checked==true) 
        {
            document.getElementById("IDcheckbox9").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox9").checked=false; 
			 var StateCheckbox = "false";
        }
	
	console.log("OverlaySettings_Checkbox9: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox9", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox9").then(function(result) {
			console.log("New Checkbox9 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox9, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_10(IDcheckbox) {
    if(document.getElementById("IDcheckbox10").checked==true) 
        {
            document.getElementById("IDcheckbox10").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox10").checked=false; 
			 var StateCheckbox = "false";
        }
	
	console.log("OverlaySettings_Checkbox10: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox10", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox10").then(function(result) {
			console.log("New Checkbox10 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox10, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_11(IDcheckbox) {
    if(document.getElementById("IDcheckbox11").checked==true) 
        {
            document.getElementById("IDcheckbox11").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox11").checked=false; 
			 var StateCheckbox = "false";
        }
	
	console.log("OverlaySettings_Checkbox11: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox11", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox11").then(function(result) {
			console.log("New Checkbox11 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox11, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_12(IDcheckbox) {
    if(document.getElementById("IDcheckbox12").checked==true) 
        {
            document.getElementById("IDcheckbox12").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox12").checked=false; 
			 var StateCheckbox = "false";
        }
	
	console.log("OverlaySettings_Checkbox12: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox12", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox12").then(function(result) {
			console.log("New Checkbox10 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox12, error: " + err);
	});
	Function_Update_Settings()
}

function Function_checkbox_13(IDcheckbox) {
    if(document.getElementById("IDcheckbox13").checked==true) 
        {
            document.getElementById("IDcheckbox13").checked=true;
			 var StateCheckbox = "true";
        }
    else
        {   
            document.getElementById("IDcheckbox13").checked=false; 
			 var StateCheckbox = "false";
        }
	
	console.log("OverlaySettings_Checkbox13: " + StateCheckbox);
	VRUB.Plugins.PersistentStore.Set("OverlaySettings_Checkbox13", (StateCheckbox).toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("OverlaySettings_Checkbox13").then(function(result) {
			console.log("New Checkbox13 State: " + StateCheckbox);
		});
	}).reject(function(err) {
		console.log("Failed to set Checkbox13, error: " + err);
	});
	Function_Update_Settings()
}


function Function_Update_Settings() {
	VRUB.Plugins.PersistentStore.Set("Update_Settings", ("true").toString()).then(function() {
		VRUB.Plugins.PersistentStore.Fetch("Update_Settings").then(function(result) {
			console.log("New Update_Settings State: " + result);
		});
	}).reject(function(err) {
		console.log("Failed to set Update_Settings, error: " + err);
	});
}





