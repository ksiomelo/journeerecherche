// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function verifyCV(){
	//return true;
	if (document.getElementById('inscription_cv').value == '') {
		return confirm("Vous n'avez pas mis joint votre CV, votre profil ne sera probablement pas assez visité par les enterprises. Voulez-vous continuer?");
	} else return true;
}

function calcLunch(parts){
	if (! isNaN(parts) && document.getElementById("user_lunch").checked) { 
		$("#total_price").html(15*parts+" Euros");
	} else {
		$("#total_price").html("0");
	}
}

function updatePrice(){
	calcLunch(document.getElementById("user_participants").value);
}

var ecpLabs = {"MAS": "1",
  "LGI": "2",
  "MSSMat": "3",
  "LGPM": "4",
  "EM2C": "5",
  "SPMS": "6",
  "LPQM": "7",
  "LISMMA": "8"
};

var supelecLabs = {"E3S": "9",
  "LGEP": "10",
  "L2S": "11",
  "SONDRA": "12",
  "IETR": "13",
  "SSIR": "14",
  "LMOPS": "15",
  "IMS": "16"
};


function changeLabos(isCentrale){
	
	var newOptions;
	if (isCentrale) newOptions = ecpLabs;
	else newOptions = supelecLabs;
	
	var $el = $("#inscription_laboratory");
	$el.empty(); // remove old options
	$.each(newOptions, function(key, value) {
	  $el.append($("<option></option>")
	     .attr("value", value).text(key));
	});
}

