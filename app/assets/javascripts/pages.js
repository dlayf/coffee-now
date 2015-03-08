/*var zip;
var APIkey = "AIzaSyAbGKM9_wSmQWSh9th1ezcSFuSxnAo5dJA";

var results;


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


 This method pulls the data from the "zipcode fields, concatinates it with our search term - 
 "coffeeshop" - and the API key, and sends the request.





function makeRequest(){



	zip = $('#zipcode').val();
	
	var terms = ("http://maps.googleapis.com/maps/api/place/textsearch/json?query=coffeeshop+in+" + zip + "+&key=" + APIkey);

	console.log("Full query: " + terms);
	$('#zipcode').val("");


	// this is the "send request" bit
      

	results = $.ajax({
          url: terms,
          dataType: 'json',
          success: function() { alert('hello!'); },
          error: function() { alert('boo!'); },
        });
};


$(document).ready(main);*/