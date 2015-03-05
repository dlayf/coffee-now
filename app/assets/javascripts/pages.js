function main(){

	console.log("ready to go!");

	initialize();






};


  function initialize() {
        var mapOptions = {
          center: { lat: 40.7127, lng: -74.0059},
          zoom: 12
        };
        var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
      }
      



$(document).ready(main);