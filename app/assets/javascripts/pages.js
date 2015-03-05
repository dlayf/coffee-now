var zip;


function main(){

	console.log("ready to go!");


// Submit the zipcode on either button click or on "Enter"
	$('.btn').click(function(){
		console.log("Button Clicked!");
		makeRequest();
	});

	$("input").keypress(function(event) {
	    if (event.which == 13) {
	        event.preventDefault();
	        makeRequest();
	    }
	});


};

function makeRequest(){

	zip = $('#zipcode').val();
	console.log("Zipcode: " + zip);
	var terms = "coffeeshop+in+" + zip;
	console.log("Full query: " + terms);
	$('#zipcode').val("");
      
}


$(document).ready(main);