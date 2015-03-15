function main(){

	console.log("ready to go!");

	$("#gon-name").text(gon.win_name);
	$("#gon-address").text(gon.win_address);
	$("#gon-rating").text(gon.win_rating);
	$("#gon-phone").text(gon.win_phone);
	$("#gon-arr1").text(gon.arr1);
	$("#gon-arr2").text(gon.arr2);



	$("#winning-title").text(gon.win_name);
	$("#winning-address").text(gon.win_address);
	$("#winning-rating").text(gon.win_rating);
	$("#gon-phone").text(gon.win_phone);
	$("#winning-photo").attr("src", gon.win_photo_url);






};







$(document).ready(main);