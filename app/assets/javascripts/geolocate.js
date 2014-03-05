$(document).ready(function() {

	function geolocationSuccess(position) {
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
	$.ajax({
		url: "/users",
		method: 'GET',
		data: {
			longitude: longitude,
			latitude: latitude
		},
		dataType: 'script'
	})
}
	function geolocationError(error) {
		console.log("There was an error :(");
	}
	if ("geolocation" in navigator) {
		navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
	} else {
		alert("Get a better browser");
	}
});